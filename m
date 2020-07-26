Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501DEC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 17:13:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE902065F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 17:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZGlymG6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CE902065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E53A0204B7;
	Sun, 26 Jul 2020 17:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJwwkGqyxyGp; Sun, 26 Jul 2020 17:13:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 232C420119;
	Sun, 26 Jul 2020 17:13:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B605C004F;
	Sun, 26 Jul 2020 17:13:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84081C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 17:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9F17B87F9C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 17:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aW7vcv6LmodK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 17:12:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BE3C587F71
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 17:12:45 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id l4so14669022ejd.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 10:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version:content-id;
 bh=e7qvTHqYv9Rf8V4e3ubVAQcM7EWI5scltqAZNH6wxXI=;
 b=fZGlymG6dN54YRnA2979D3qjP26q1KCTw+ctL4PCktRm2c9c0Ul/zBQnsG1rFZXbXR
 F5RFtdUsqv97GwFILSvyY4dCKyEr9+sWTt8lN55t8ziTEo6guGraEd2ZrL+JkH7Bn+Cz
 xdLai4/kNhYi4PYtOEZV0/sJ9VygkFQHx3CLadTVPuOstt+JQjYqWqz6pPZPGXc36Ttn
 COrruqU+HIBgY0dWxSRekACRMAtlFw0FAeTfp/nt1TeOFz57xcprLE1Aa2W+nY7bp/Hy
 +DTKXOdPUOUXckcLoQgzyvxrw4hzKESDHALWVH99EeohtocnmNscezt2ZlQMs9eRuzz+
 mJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version:content-id;
 bh=e7qvTHqYv9Rf8V4e3ubVAQcM7EWI5scltqAZNH6wxXI=;
 b=So2vIBwtxvURhlfYARUgeFAHwBrj3PT+lcGTcFO4dmlDeXZdPcpR/IMrwWZgKl1d26
 IYcUJ3UY3LGGziR3wU/BrXifzdxdzbi+pK/1ThuLKsPRPJTiaK4kNc948qcdT5wHKwau
 zIC2QrAEBv9ulwextZXVlzTjRYBj//oGeX1wsZjec56ryESv0MLFIk2ZpgNdTjB+NbwR
 Wgrc/K6n0Z5Si7Kbiwuubba6RaqSeypnaLE5+iE6OFxjKMMO+/Jziq9Sj1rZXrSbEILF
 Q875WhYIPr6feSmX3x3ymsEtXlsIE2+lPmMqXyV01rSX0bA42WXSSEzBECWOmE928/6P
 0TIg==
X-Gm-Message-State: AOAM531XzzI9y0VINfUMllq+PImB4R+ICJdvVKEemWq5Qn89NZrd8AFy
 20L0Bl2qUKVXGwBefWqsGdWHxjR5Rvg=
X-Google-Smtp-Source: ABdhPJxjWP/c67cspFRKHDUQEsMzxSJuJ1crybLqMsOASjk/vfndoupH/pHg49/8W2T0AvUUOGqQew==
X-Received: by 2002:a17:906:31c8:: with SMTP id
 f8mr17158582ejf.269.1595783564073; 
 Sun, 26 Jul 2020 10:12:44 -0700 (PDT)
Received: from felia ([2001:16b8:2ddd:7800:396d:7798:779b:80f5])
 by smtp.gmail.com with ESMTPSA id vr6sm3424941ejb.36.2020.07.26.10.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 10:12:43 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 26 Jul 2020 19:12:42 +0200 (CEST)
X-X-Sender: lukas@felia
To: Nachiket N <nachiketun8@gmail.com>
In-Reply-To: <CA+Dc07ijF4HT2zJBbVGRkzTk3wvN596baXies-6SmgWfoMgphQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2007261910230.3702@felia>
References: <20200726075802.396907-1-nachiketun8@gmail.com>
 <alpine.DEB.2.21.2007261310140.6195@felia>
 <CA+Dc07ijF4HT2zJBbVGRkzTk3wvN596baXies-6SmgWfoMgphQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1411749805-1595783525=:3702"
Content-ID: <alpine.DEB.2.21.2007261912360.3702@felia>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Script: Checkpatch: Disables
 commit log length check in case of valid signature tags
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1411749805-1595783525=:3702
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2007261912361.3702@felia>



On Sun, 26 Jul 2020, Nachiket N wrote:

> On Sun, Jul 26, 2020 at 4:43 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> 
>       Commit message is wrong.
> 
>       On Sun, 26 Jul 2020, Nachiket Naganure wrote:
> 
>       > Checkpatch.pl outputs warnings for commit description lines that exceed
>       > beyond 75 characters. Sometimes these lines might contain signature tags
>       > that cannot be shortened. The patch checks if the line has any valid
>       > signature tags and disables the warning in such a case.
>       >
>       > For instance in commit ID ac854131d984, the patch
>       > contains a Reported by tag line which exceeds 75 chars. And there is no
>       > valid way to shorten the length.
>       >
>       > To fix this, we need to check if the $line variable has any valid
>       > signature tags which are already stored in $signature_tags variable.
>       >
> 
>       Read the documentation on commit messages. Think about the things you are
>       doing wrong in your commit message.
> 
>       > Signed-off-by: Nachiket Naganure <nachiketun8@gmail.com>
>       > ---
>       >  scripts/checkpatch.pl | 2 ++
>       >  1 file changed, 2 insertions(+)
>       >
>       > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>       > index 197436b20288..b6d5e2a8fce8 100755
>       > --- a/scripts/checkpatch.pl
>       > +++ b/scripts/checkpatch.pl
>       > @@ -2806,6 +2806,8 @@ sub process {
>       >                                       # filename then :
>       >                     $line =~ /^\s*(?:Fixes:|Link:)/i ||
>       >                                       # A Fixes: or Link: line
>       > +          $line =~ /$signature_tags/ ||
>       > +          # Checks for signature_tags
> 
>       Change looks more reasonable now.
>       Indentation is broken.
> 
> 
>       Maybe two or three iterations on this patch and it is getting ready for
>       submission.
> 
>       Lukas
> 
>       >                     $commit_log_possible_stack_dump)) {
>       >                       WARN("COMMIT_LOG_LONG_LINE",
>       >                            "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
>       > --
>       > 2.25.1
>       >
>       >
>

Your email client is broken for sending responses.
 
> Checkpatch: Disable length check warning for signature tag
> 
> Disable commit log length check in case of the signature tag. If the commit
> log line has valid signature tags such as "Reported-and-tested-by" with
> more than 75 characters, it suppresses the long line length warning.
> 
> For instance in Commit ac854131d984 (USB: core: Fix misleading driver
> bug report), the corresponding contains a "Reported by" tag line which
> exceeds 75 chars. And there is no valid way to shorten the length.
> 
> 
> The modified commit message is written above. Changed the language to
> imperative and shortened the subject line. Fixed the commit ID reference.
> Are there any other changes required?
>

Send a PATCH v2 and I will provide feedback on that.

Lukas 
--8323329-1411749805-1595783525=:3702
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-1411749805-1595783525=:3702--
