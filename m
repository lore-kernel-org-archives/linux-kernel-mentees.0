From: corbet at lwn.net (Jonathan Corbet)
Date: Sat, 22 Jun 2019 08:54:11 -0600
Subject: [Linux-kernel-mentees] [PATCH 1/3] Documentation: RCU: Convert
 RCU basic concepts to ReST
In-Reply-To: <20190622070133.GA7149@rYz3n>
References: <20190622070133.GA7149@rYz3n>
Message-ID: <20190622085411.3c1692c2@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sat, 22 Jun 2019 02:01:33 -0500
Jiunn Chang <c0d1n61at3 at gmail.com> wrote:

> Convert RCU basic concepts and add TOC tree hook.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>

A few overall comments...

 - Hopefully Paul is OK with converting these documents.  If not, Paul,
   now seems like the time to complain :)

 - It's good to have a cover letter on a multi-part patch set like this
   describing the overall project.  It's also important to copy patches to
   a public list.  At a minimum, linux-doc would be a good place; I'd
   suggest linux-kernel as well - it doesn't get enough email and people
   get lonely there.

 - (The part that people get mad at me about): we should think about
   whether this should remain a top-level directory.  I would argue for
   putting it into the core-api manual, but others may disagree.

Thanks for working to improve our docs!  In this case, the conversion
itself looks good.

jon
