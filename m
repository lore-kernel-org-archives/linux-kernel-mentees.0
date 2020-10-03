Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527DBC41604
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 14:45:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A2D206B8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 14:45:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ph3DYAKH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1A2D206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6BF8286A83;
	Sat,  3 Oct 2020 14:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKb1fKNYjO+V; Sat,  3 Oct 2020 14:45:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A6B084D35;
	Sat,  3 Oct 2020 14:45:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71B76C016F;
	Sat,  3 Oct 2020 14:45:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF67CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C320D20371
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:45:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1L0HduqIgDD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:45:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by silver.osuosl.org (Postfix) with ESMTPS id F2B382002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:45:21 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id md26so5631823ejb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=n4xktQ72TdIKvG/KBr/B0S7Th1Rin55/sGqaGP/OCiw=;
 b=Ph3DYAKH8PVSWkgLX9bYazQzrVW5DXs1rkNze1vuyMpTd/osLCysXPb7K+/wG0liQY
 ibTV4qeuryTUsdyJYSEDQGpmrMwGNN+NgXLa3p9xqcAWJm8yUcKm8iaQ4gr7q8oTuVBk
 B2L91Jm4Ff3ynLJbAIJeco6SoPNvtkYPVg7HmM5QEHYfOzrW5OfsBvWJ964bQivrWnKv
 4C21kcSE44NZPsfRmugTSzOEhabooORykxt03uUboea9+mg6GnkvgtHr0d54k2oLi4oe
 uLqJjW1c77MF+tdHsoyFIKQqHSE1oKhVqE6X/IlvP4SbDlbFhG6UyYNZSCP+GTsZ7ukE
 /wFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=n4xktQ72TdIKvG/KBr/B0S7Th1Rin55/sGqaGP/OCiw=;
 b=AhMbDWAsl/xh8JALq5okey/b4FKxP7AeiAGEZ9By6QAcWWSaz3tiNw0DT9NY0J3gkO
 Xes4nh5EH1QHzLNAhHKC3MDbPXtq7uKXxN7V8AAS1AM1wuHVUR0h+EabznQaQe4LvH9X
 JXWtBbvsq0Z2u25bl+s0mYCBWYMcNVyAG7fNEhafnCZ+M+u1kEojdsp4eVCUg2bafSeM
 /PItF0AjGvTEN4CcyAkZgpsbWquJDdv6KPqNMB9n4sH7zn/cz12A714L34jZNTZQQYNX
 YKyWkexGauyjqi+9CZH7BxvnYKgoRzP/PJj7trV/9D6uwNdcIoYDIjUJ3W0a4x+HlRzg
 040w==
X-Gm-Message-State: AOAM532r3cAtd4zBuHegpyuxRBPbpiUL7wwCEyrBtmDnFX6/K0/HuuEI
 D4KesCvhCvQgcg2yS3V4U64=
X-Google-Smtp-Source: ABdhPJzJqJKmEjZ6MBkj8b/xIwhr95pPCcM5HcIV6Hf3yJz+ojjbrFB0/6qvq3aiAxbDx1JXWo3d7g==
X-Received: by 2002:a17:906:6409:: with SMTP id
 d9mr6731015ejm.344.1601736320216; 
 Sat, 03 Oct 2020 07:45:20 -0700 (PDT)
Received: from felia ([2001:16b8:2d0f:200:eda2:96bd:7846:2b11])
 by smtp.gmail.com with ESMTPSA id v26sm4326451edw.64.2020.10.03.07.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 07:45:19 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 3 Oct 2020 16:45:13 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <5c95afeb-94b7-7be8-0e7d-e506124d4054@gmail.com>
Message-ID: <alpine.DEB.2.21.2010031642500.5070@felia>
References: <ef1681fc-1123-15e7-0f93-2cc8b70354e7@gmail.com>
 <alpine.DEB.2.21.2010020544590.7067@felia>
 <3ae58bf3-3725-f7c8-0ab5-ae7a2d8d28df@gmail.com>
 <alpine.DEB.2.21.2010030859430.7503@felia>
 <5c95afeb-94b7-7be8-0e7d-e506124d4054@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] kconfig: use interpreters to
	invoke scripts
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



On Sat, 3 Oct 2020, Ujjwal Kumar wrote:

> On 03/10/20 12:35 pm, Lukas Bulwahn wrote:
> > 
> > 
> > On Fri, 2 Oct 2020, Ujjwal Kumar wrote:
> > 
> >> On 02/10/20 9:20 am, Lukas Bulwahn wrote:
> >>>
> >>>
> >>> On Fri, 2 Oct 2020, Ujjwal Kumar wrote:
> >>>
> >>>> We cannot rely on execute bits to be set on files in the repository.
> >>>> The build script should use the explicit interpreter when invoking any 
> >>>> script from the repository.
> >>>>
> >>>> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> >>>> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> >>>>
> >>>> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> >>>> Suggested-by: Kees Cook <keescook@chromium.org>
> >>>> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >>>> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> >>>
> >>>
> >>> Ujjwal, you have nicely split the patches. I suggest you send out this 
> >>> patch and the patch "kbuild: use interpreters to incoke scripts" together 
> >>> as one patch series.
> >>>
> >>> You just need to write a cover letter and explain there which steps you 
> >>> did to find this being wrong before and what you did to test that it is 
> >>> now corrected.
> >>>
> >>> Also, can you please share on this list to whom/which lists you would send 
> >>> this patch series?Running 'get_maintainer.pl' script I get the following list.
> >>
> >> kconfig: use interpreters to invoke scripts-
> >>
> > 
> > Make those people explicitly to:
> > 
> >> Nathan Chancellor <natechancellor@gmail.com>
> >> Nick Desaulniers <ndesaulniers@google.com>
> > 
> > Nathan and Nick were working on the multi-compier support.
> > 
> >> Masahiro Yamada <masahiroy@kernel.org>
> > 
> > Masahiro-san is the important maintainer here.
> > also add Michal Marek.
> > 
> > I guess they are all optional:
> > 
> >> "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> >> Masami Hiramatsu <mhiramat@kernel.org>
> >> Daniel Borkmann <daniel@iogearbox.net>
> >> Andrew Morton <akpm@linux-foundation.org>
> >> Krzysztof Kozlowski <krzk@kernel.org>
> >> Valentin Schneider <valentin.schneider@arm.com>
> >> Nick Terrell <terrelln@fb.com>
> >> "Eric W. Biederman" <ebiederm@xmission.com>
> >> Johannes Weiner <hannes@cmpxchg.org>
> > 
> > 
> > Yes, the mailing lists should be added:
> > 
> >> linux-kernel@vger.kernel.org
> >> clang-built-linux@googlegroups.com
> >>
> > 
> > also add the linux-kbuild mailing list.
> > 
> >>
> >> kbuild: use interpreters to invoke scripts-
> >>
> > 
> > These are the important maintainers:
> > 
> >> Masahiro Yamada <masahiroy@kernel.org>
> >> Michal Marek <michal.lkml@markovi.net>
> > 
> > 
> > I think these are mainly developers that some of the lines;
> > 
> > maybe just put them CC:
> > 
> >> Catalin Marinas <catalin.marinas@arm.com>
> >> Will Deacon <will@kernel.org>
> >> Tony Luck <tony.luck@intel.com>
> >> Fenghua Yu <fenghua.yu@intel.com>
> >> Nick Hu <nickhu@andestech.com>
> >> Greentime Hu <green.hu@gmail.com>
> >> Vincent Chen <deanbo422@gmail.com>
> >> Vincenzo Frascino <vincenzo.frascino@arm.com>
> >> Kees Cook <keescook@chromium.org>
> >> Nick Desaulniers <ndesaulniers@google.com>
> >> Alexander Popov <alex.popov@linux.com>
> >> Mark Brown <broonie@kernel.org>
> >> Sami Tolvanen <samitolvanen@google.com>
> >> Nathan Chancellor <natechancellor@gmail.com>
> >> Denis Efremov <efremov@linux.com>
> > 
> > 
> > Mailing lists looks good:
> > 
> >> linux-kbuild@vger.kernel.org
> >> linux-kernel@vger.kernel.org
> >> linux-arm-kernel@lists.infradead.org
> >> linux-ia64@vger.kernel.org
> >>
> > 
> > I think you have a good list.
> 
> For PATCH 1/2:
> Nathan Chancellor <natechancellor@gmail.com>
> Nick Desaulniers <ndesaulniers@google.com>
> Masahiro Yamada <masahiroy@kernel.org>
> Michal Marek <michal.lkml@markovi.net>
> linux-kbuild@vger.kernel.org
> linux-kernel@vger.kernel.org
> clang-built-linux@googlegroups.com
> linux-kernel-mentees@lists.linuxfoundation.org
> 
> For PATCH 2/2:
> Nathan Chancellor <natechancellor@gmail.com>
> Nick Desaulniers <ndesaulniers@google.com>
> Masahiro Yamada <masahiroy@kernel.org>
> Michal Marek <michal.lkml@markovi.net>
> linux-kbuild@vger.kernel.org
> linux-kernel@vger.kernel.org
> linux-arm-kernel@lists.infradead.org
> linux-ia64@vger.kernel.org
> linux-kernel-mentees@lists.linuxfoundation.org
> 
> Is it okay to send one patch from the series to a recipient and skip 
> the other patches?
> Should I merge recipients for each patch into one to create a common list 
> of recipients for all the patches (with cover letter) in the series?
> And send all the patches (with cover letter) to that common list.
>

Both options are fine. I think it is up to your personal preference.


Merging them is probably just easier to write a git send-email command.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
