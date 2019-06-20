From: lnowakow at eng.ucsd.edu (Luke Nowakowski-Krijger)
Date: Thu, 20 Jun 2019 16:32:59 -0700
Subject: [Linux-kernel-mentees] [PATCH v4] Media: Radio: Change
 devm_k*alloc to k*alloc
In-Reply-To: <20190618081449.GA24889@kroah.com>
References: <f6821f6c-bd89-00bd-a3d9-721f3e3a11cd@eng.ucsd.edu>
	<20190618081449.GA24889@kroah.com>
Message-ID: <20190620233259.GA8820@luke-XPS-13>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Tue, Jun 18, 2019 at 10:14:49AM +0200, Greg KH wrote:
> On Tue, Jun 18, 2019 at 12:47:02AM -0700, Luke Nowakowski-Krijger wrote:
> > Change devm_k*alloc to k*alloc to manually allocate memory. 
> > 
> > Memory is freed in v4l2.release callback which now calls 
> > raremono_device_release to free up the appropriate memory, 
> > just like in radio-shark driver. 
> 
> Trailing whitespace :(
> 
> Please fix your editor.
> 
> > 
> > 
> > Reported-by: syzbot+a4387f5b6b799f6becbf at syzkaller.appspotmail.com
> > Signed-off-by: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
> > ---
> 
> If this is a new version, properly version your patches, with a v2 and a
> description below the --- line as to what changed.  The documentation
> should say exactly how to do this.
> 
> Also, did you submit this to syzbot for testing?  You can do that
> through the email interface.
> 
> thanks,
> 
> greg k-h

Hi Greg, 

I sent the patch through the email interface and tested it. It did not
trigger the bug. Do I put the "tested-and-reporteed by" tag instead? Or
do I just mention testing methods and results? 

Thanks
- Luke Nowakowski-Krijger
