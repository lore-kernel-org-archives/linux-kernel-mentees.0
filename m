From: gregkh at linuxfoundation.org (Greg KH)
Date: Sun, 5 May 2019 14:44:14 +0200
Subject: [Linux-kernel-mentees] [Linux-Kernel-Mentees] Regarding git
 workflows
In-Reply-To: <20190505115129.GA4737@bharath12345-Inspiron-5559>
References: <20190505115129.GA4737@bharath12345-Inspiron-5559>
Message-ID: <20190505124414.GB21504@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sun, May 05, 2019 at 05:21:29PM +0530, Bharath Vedartham wrote:
> Hi all,
> 
> I would like to know about more efficient ways to download patches from
> mail. To download patches, I goto view attachement and save it to a file
> in my local filesystem and then git apply it to my repo. This really
> does not help me in the case of patchsets where I have to download each
> individual patch and apply them according to their number.
> 
> What are some other better ways to improve my git workflows?

Download them all at once, to a single mbox file, and then use 'git am'
to apply them to a git branch.

That's what we use for applying patches that are sent in emails, we do
not do it one-patch-at-a-time, that would take way too much time, as you
have found out :)

Hope this helps,

greg k-h
