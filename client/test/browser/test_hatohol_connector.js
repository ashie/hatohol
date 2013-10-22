describe('HatoholConnector', function() {
  var TEST_USER = "test-user";
  var TEST_PASSWORD = "test*pass*d";
  before(function(done) {
    var csrfmiddlewaretoken = $("*[name=csrfmiddlewaretoken]").val();
    $.ajax({
      url: "/tunnel/test/user",
      type: "POST",
      data: {"user":TEST_USER, "password":TEST_PASSWORD, "flags":0},
      beforeSend: function(xhr) {
        xhr.setRequestHeader("X-CSRFToken", csrfmiddlewaretoken);
      },
      success: function(data) {
        var parser = new HatoholReplyParser(data);
        expect(parser.getStatus()).to.be(REPLY_STATUS.OK);
        done();
      },
      error: function connectError(XMLHttpRequest, textStatus, errorThrown) {
        expect().fail(textStatus);
        done();
      },
    });
  });

  beforeEach(function(done) {
    HatoholSessionManager.deleteCookie();
    done();
  });

  afterEach(function(done) {
    HatoholDialogObserver.reset();
    done();
  });

  it('get simplest', function(done) {
    HatoholDialogObserver.registerCreatedCallback(function(id, obj) {
      if (id == "hatohol_login_dialog")
        obj.makeInput(TEST_USER, TEST_PASSWORD);
    });

    var params = {
      url: "/test",
      replyCallback: function(data, parser) {
        expect(data).not.to.be(undefined);
        expect(parser).not.to.be(undefined);
        expect(parser.getStatus()).to.be(hatohol.HTERR_OK);
        done();
      },
    };
    var connector = HatoholConnector(params);
  })

  it('post simple', function(done) {
    HatoholDialogObserver.registerCreatedCallback(function(id, obj) {
      if (id == "hatohol_login_dialog")
        obj.makeInput(TEST_USER, TEST_PASSWORD);
    });

    var queryData = {
      csrfmiddlewaretoken: $("*[name=csrfmiddlewaretoken]").val(),
      "A":123, "S":"foo", "!'^@^`?":"<(.)>"};
    var params = {
      url: "/test",
      request: "POST",
      data: queryData,
      replyCallback: function(data, parser) {
        expect(data).not.to.be(undefined);
        expect(parser).not.to.be(undefined);
        expect(parser.getStatus()).to.be(hatohol.HTERR_OK);
        expect(data.queryData).to.eql(queryData);
        done();
      },
    };
    var connector = HatoholConnector(params);
  })
});

