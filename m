From: corbet@lwn.net (Jonathan Corbet)
Date: Thu, 27 Jun 2019 08:34:43 -0600
Subject: [Linux-kernel-mentees] [PATCH v5 1/5] Documentation: RCU:
 Convert RCU basic concepts to reST
In-Reply-To: <20190626200705.24501-2-c0d1n61at3@gmail.com>
References: <20190626191249.21135-1-c0d1n61at3@gmail.com>
	<20190626200705.24501-2-c0d1n61at3@gmail.com>
Message-ID: <20190627083443.4f4918a7@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190627143443.79oO6qu2NlQ7DC6eHsZZfbono2eHoHu9NL2E_2mMTEo@z>

On Wed, 26 Jun 2019 15:07:01 -0500
Jiunn Chang <c0d1n61at3 at gmail.com> wrote:

> RCU basic concepts reST markup.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> Reviewed-by: Joel Fernandes (Google) <joel at joelfernandes.org>

So this is a little detail but ... your signoff should be the last thing
in the set of tags on the patch.

This isn't worth making you do yet another revision, so I went ahead and
applied the patches and fixed the tag ordering on the way in.  I'll also
append a patch adding the new RCU stuff into the core-api manual so people
can actually get to it.

Thanks,

jon
