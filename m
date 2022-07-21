Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61528C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Jul 2022 16:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBEDE4099C;
	Thu, 21 Jul 2022 16:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBEDE4099C
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BBkvMnqQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOlYrpR9dMj9; Thu, 21 Jul 2022 16:33:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9657E40961;
	Thu, 21 Jul 2022 16:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9657E40961
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57289C0035;
	Thu, 21 Jul 2022 16:33:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F59BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 16:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D701040921
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 16:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D701040921
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0075Hpwk6nDV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 16:33:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D02874091D
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D02874091D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RhI3VCUzNHo5JklMmIqECqYQ6SyTPpDz3EAd2IXpnCc=; b=BBkvMnqQohd6YdtIM+p3u0mFPe
 E/h4AwZ7lEA/5Y8xtvIbzGvgnsQ+FNj4guVIegorCmbP5MBFp1kHxpemTERABuEqZ4J+T6nTXOP8r
 +zbgnboMaloQK6Jsb7IZMCf9fOJTn6xqhdyJHHC6fwJldazzKn5eN8AQlq8OKBOXxub0DtA13WpkP
 KMesSlG1Jiv3g7WQ9MkfnGGeOYl6POj7vOHgXKsJtpeI5YiIu/gqrCmn+9Ilr8CN85BUybrBHmFcN
 HpiYvHrU2IZfWFiAwCFzhy5BLLobYnR+0MAa4ELRT5DniZYFouSXRoEXrQLvT6GQ86CmgER+dYAtI
 aHKs3d0A==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1oEZ6s-00A2Mo-7j; Thu, 21 Jul 2022 16:33:10 +0000
Date: Thu, 21 Jul 2022 09:33:10 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Doug Anderson <dianders@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH RESEND] scripts/gdb: Fix gdb 'lx-symbols' command
Message-ID: <Ytl/xkb9OC43dgJd@bombadil.infradead.org>
References: <20220721093042.9840-1-khalid.masum.92@gmail.com>
 <CAD=FV=UbRX194rDztr_=eoALg4kTmjzq=EXCX6RJSSq3vO=fbw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=UbRX194rDztr_=eoALg4kTmjzq=EXCX6RJSSq3vO=fbw@mail.gmail.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>, Aaron Tomlin <atomlin@redhat.com>,
 Kieran Bingham <kbingham@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Jan Kiszka <jan.kiszka@siemens.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Jul 21, 2022 at 09:24:31AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jul 21, 2022 at 2:31 AM Khalid Masum <khalid.masum.92@gmail.com> wrote:
> >
> > Currently the command 'lx-symbols' in gdb exits with the error`Function
> > "do_init_module" not defined in "kernel/module.c"`. This occurs because
> > the file kernel/module.c was moved to kernel/module/main.c.
> >
> > Fix this breakage by changing the path to "kernel/module/main.c" in
> > LoadModuleBreakpoint.
> >
> > Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> > ---
> >  scripts/gdb/linux/symbols.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
> > index 46f7542db08c..dc07b6d12e30 100644
> > --- a/scripts/gdb/linux/symbols.py
> > +++ b/scripts/gdb/linux/symbols.py
> > @@ -180,7 +180,7 @@ lx-symbols command."""
> >                  self.breakpoint.delete()
> >                  self.breakpoint = None
> >              self.breakpoint = LoadModuleBreakpoint(
> > -                "kernel/module.c:do_init_module", self)
> > +                "kernel/module/main.c:do_init_module", self)
> 
> Fixes: cfc1d277891e ("module: Move all into module/")
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Acked-by: Luis Chamberlain <mcgrof@kernel.org>

This should go to Linus prior to the next rc.  Linus, I think this is
with picking up now as I smell a final release soon.

FWIW a git grep of "kernel/module\.c" reveals no other code users of
this path.

  Luis
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
