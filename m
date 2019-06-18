From: gregkh@linuxfoundation.org (Greg KH)
Date: Tue, 18 Jun 2019 10:14:49 +0200
Subject: [Linux-kernel-mentees] [PATCH v4] Media: Radio: Change
 devm_k*alloc to k*alloc
In-Reply-To: <f6821f6c-bd89-00bd-a3d9-721f3e3a11cd@eng.ucsd.edu>
References: <f6821f6c-bd89-00bd-a3d9-721f3e3a11cd@eng.ucsd.edu>
Message-ID: <20190618081449.GA24889@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190618081449.oUdh-nar5_6CN-jlz-PdgH9ncuwprFAifyxkKnpBGxw@z>

On Tue, Jun 18, 2019 at 12:47:02AM -0700, Luke Nowakowski-Krijger wrote:
> Change devm_k*alloc to k*alloc to manually allocate memory. 
> 
> Memory is freed in v4l2.release callback which now calls 
> raremono_device_release to free up the appropriate memory, 
> just like in radio-shark driver. 

Trailing whitespace :(

Please fix your editor.

> 
> 
> Reported-by: syzbot+a4387f5b6b799f6becbf at syzkaller.appspotmail.com
> Signed-off-by: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
> ---

If this is a new version, properly version your patches, with a v2 and a
description below the --- line as to what changed.  The documentation
should say exactly how to do this.

Also, did you submit this to syzbot for testing?  You can do that
through the email interface.

thanks,

greg k-h
