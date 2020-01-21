Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96836C33CAA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 06:30:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71B2E22522
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 06:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71B2E22522
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4B46285E7C;
	Tue, 21 Jan 2020 06:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rv62WVkL_C9h; Tue, 21 Jan 2020 06:30:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D78D85E07;
	Tue, 21 Jan 2020 06:30:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 777D3C0178;
	Tue, 21 Jan 2020 06:30:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A4AEC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 06:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 45A9020430
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 06:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBjAsapF42C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 06:30:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by silver.osuosl.org (Postfix) with ESMTPS id EA2FA2041B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 06:30:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,344,1574118000"; d="scan'208";a="432302784"
Received: from unknown (HELO hadrien) ([167.98.102.107])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 07:30:03 +0100
Date: Tue, 21 Jan 2020 06:30:03 +0000 (GMT)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <7fc95d036dbda26e6540839ef25c5c09c21ca747.camel@gmail.com>
Message-ID: <alpine.DEB.2.21.2001210629190.2301@hadrien>
References: <20200119134812.32748-1-jaskaransingh7654321@gmail.com>
 <alpine.DEB.2.21.2001210619100.2301@hadrien>
 <7fc95d036dbda26e6540839ef25c5c09c21ca747.camel@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [PATCH] parsing_hacks: Add bool to list
	of known typedefs
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



On Tue, 21 Jan 2020, Jaskaran Singh wrote:

> On Tue, 2020-01-21 at 06:20 +0000, Julia Lawall wrote:
> >
> > On Sun, 19 Jan 2020, Jaskaran Singh wrote:
> >
> > > bool is widely used in the Linux kernel. Certain cases of
> > > parsing_hacks.ml would mislabel bool.
> > >
> > > Add bool to the list of known typedefs.
> > >
> > > Stats of --parse-c on Linux v5.5-rc4 are as follows:
> > >
> > > Before:
> > >
> > >   nb good = 18956150,  nb passed = 134062 =========> 0.70% passed
> > >
> > > After:
> > >
> > >   nb good = 18956150,  nb passed = 134073 =========> 0.70% passed
> >
> > Why did nb passed increase?  These are tokens that will not be able
> > to be
> > transformed by a semantic patch.
> >
>
> I suspect it's instances of nokprobe_inline in
> linux/kernel/trace/trace_kprobe.c. They're marked as CppMacro.

OK, that looks ok.  Could you update the log messages with that
information?

thanks,
julia


>
> Here's results from my diff:
>
> 20402,20406c20288,20294
> < passed:bool
> < passed:bool
> < passed:bool
> < passed:bool
> < passed:bool
> ---
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> 20407a20296,20297
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> 20408a20299,20300
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> 20409a20302,20303
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> 20410a20305,20306
> > passed:nokprobe_inline
> > passed:nokprobe_inline
>
> Cheers,
> Jaskaran.
>
> > julia
> >
> > > Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> > > ---
> > > The above diff has been obtained after applying
> > > https://www.mail-archive.com/cocci@systeme.lip6.fr/msg06706.html
> > >
> > >  parsing_c/parsing_hacks.ml | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/parsing_c/parsing_hacks.ml
> > > b/parsing_c/parsing_hacks.ml
> > > index 685a4908..5e3301a0 100644
> > > --- a/parsing_c/parsing_hacks.ml
> > > +++ b/parsing_c/parsing_hacks.ml
> > > @@ -61,7 +61,7 @@ let is_known_typdef =
> > >        | "u_char"   | "u_short"  | "u_int"  | "u_long"
> > >        | "u8" | "u16" | "u32" | "u64"
> > >        | "s8"  | "s16" | "s32" | "s64"
> > > -      | "__u8" | "__u16" | "__u32"  | "__u64"
> > > +      | "__u8" | "__u16" | "__u32"  | "__u64" | "bool"
> > >          -> true
> > >
> > >        | "acpi_handle"
> > > --
> > > 2.21.1
> > >
> > >
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
