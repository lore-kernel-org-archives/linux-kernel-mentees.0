From: rostedt@goodmis.org (Steven Rostedt)
Date: Thu, 27 Jun 2019 11:13:24 -0400
Subject: [Linux-kernel-mentees] [PATCH v5 1/5] Documentation: RCU:
 Convert RCU basic concepts to reST
In-Reply-To: <20190627083443.4f4918a7@lwn.net>
References: <20190626191249.21135-1-c0d1n61at3@gmail.com>
	<20190626200705.24501-2-c0d1n61at3@gmail.com>
	<20190627083443.4f4918a7@lwn.net>
Message-ID: <20190627111324.1db0f1ec@gandalf.local.home>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190627151324.5mFstPneTOex08R5oW8yUlk9JvGJPDmuPvNBoOPQZEg@z>

On Thu, 27 Jun 2019 08:34:43 -0600
Jonathan Corbet <corbet at lwn.net> wrote:

> On Wed, 26 Jun 2019 15:07:01 -0500
> Jiunn Chang <c0d1n61at3 at gmail.com> wrote:
> 
> > RCU basic concepts reST markup.
> > 
> > Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> > Reviewed-by: Joel Fernandes (Google) <joel at joelfernandes.org>  
> 
> So this is a little detail but ... your signoff should be the last thing
> in the set of tags on the patch.

Note, I've been seeing this a lot lately, and then noticed, that when I
downloaded a patch directly from patchwork, it placed all the
Reviewed-by and Acked-by tags after the original Signed-off-by. I
checked the original patch on the mailing list, and it had no other
tags but the Signed-off-by. I then pulled one of my own patches, and it
did it to that patch as well.

I too prefer the Signed-off-by be last, but our tooling needs to do
this as well, otherwise it's a failure in our procedures.

-- Steve
