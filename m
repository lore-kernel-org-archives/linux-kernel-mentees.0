Return-Path: <SRS0=D8c5=34=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C5BC35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  8 Feb 2020 12:41:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC422082E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  8 Feb 2020 12:41:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfXudPHW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DC422082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D138687E24;
	Sat,  8 Feb 2020 12:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KgC+yLofXb8; Sat,  8 Feb 2020 12:41:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 537EF87E23;
	Sat,  8 Feb 2020 12:41:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B74EC0178;
	Sat,  8 Feb 2020 12:41:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8DC2C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Feb 2020 12:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B2E2886BC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Feb 2020 12:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTvsYkPg1tSp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Feb 2020 12:41:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 55B9B86B28
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Feb 2020 12:41:31 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id ep11so2116188pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 08 Feb 2020 04:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=NzAC5MHbrI5UrG1L3FVdHafeYKskK0RDKuoxzb6SsSw=;
 b=hfXudPHWgIT+H2enk6nqij9pre4evi2LXn53I2MnGnWYDwvBo34rfOWHBbjY+ljn4W
 qvJZYMWNvxPIdvDtaeMVnJ3h5lgyctgjFunGzMpZnyETgEQREHPpRuopn6A+n6Sl/ETA
 kYzQ9Xjycy2KXT2FJUbQ+rExzfI8VEZhoFLyoMGwhwC8dCr9fBZtGoY5ZzYNAXfPlveg
 +n7Vuaw2z6r3LjBeRWiK9u1XlLr2KVJGn3tEhXS38nYa7TqFtqOJeBdXT/E1BgMc6ntf
 yvsvP9vFBEtOCEYK4a54tb1V8LgmRBbfAL4WTiwQ4hHzvhl0ADNOHrlzms0iDgd0HsTt
 dNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=NzAC5MHbrI5UrG1L3FVdHafeYKskK0RDKuoxzb6SsSw=;
 b=GP61TpHPEGYA5fMMagg/5YERKUJhDRzRqX97Xv725IfC7i8Ac8OmnPXZ6KjK4MTs9Q
 9k2cQJVnXxzrSiYQy1L+13kJTZGiP+99foMm+zK1lAhXiJH4lGBWCeJz/5ky4PKFw90T
 9aQ9eScSGlEBN1HpFiDcmWG4HtSjQj4almOMp8TYWOmS6xfHdzpqTDfluaHgC5jbOQj2
 U7/zbMlwszxr1ykT1YMD8fDQMFMRwGZ33Wfj22AvAeIKzjW+GsNPkPIgWyGDc2a2VjJW
 tJeZbEQy6ADvUHEOg/LKFUIcf/PfGt+0wnv3tQWguf67m5Il7huMWy2hDHmXF8MO+wNz
 UAgw==
X-Gm-Message-State: APjAAAVrDcVYMr0p0/M4X2EsyS//TLLg+5YRUGnk+wWNSRLwGiH+eWtX
 mxHgiNc3Go2T5IuOmx588X4=
X-Google-Smtp-Source: APXvYqyPQAw/0btz4QpV4VqPX123x4OL9WLGtJyU+JzD/a8EM2qKsftVaQ7YlfRKozgftw7JD/+Klw==
X-Received: by 2002:a17:902:b583:: with SMTP id
 a3mr3714149pls.180.1581165690736; 
 Sat, 08 Feb 2020 04:41:30 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:167e:bd84:9372:6e6d:597e:c921])
 by smtp.gmail.com with ESMTPSA id i2sm5965325pjs.21.2020.02.08.04.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 04:41:30 -0800 (PST)
Message-ID: <6f51f690d06cdd2278900480bd079cd90895ec43.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 08 Feb 2020 18:11:17 +0530
In-Reply-To: <88e09c8a-e39f-2722-9f87-333d2c14a7a2@web.de>
References: <88e09c8a-e39f-2722-9f87-333d2c14a7a2@web.de>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: Julia Lawall <julia.lawall@inria.fr>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH 1/2] parsing_c: Align C
 AST and Cocci AST for const pointer variants
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

On Sat, 2020-02-08 at 09:30 +0100, Markus Elfring wrote:
> > For a pointer, the C parser constructed an AST dissimilar from that
> > of the Cocci AST. This caused failures in matching with certain
> > pointer types. For example, for the following case:
> > 
> > char *1 const *2 id;
> > 
> > The C AST constructed would be:
> > const Pointer1 -> Pointer2 -> char
> > 
> > The Cocci AST constructed would be:
> > Pointer2 -> const Pointer1 -> char
> 
> Which software development tools support to check such information?
> 

A little collection of scripts/tools I've written[1], and the
invaluable OCaml debugger :)

Cheers,
Jaskaran.

[1]http://github.com/jajajasalu2/cocci-type-test-suite

> Regards,
> Markus

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
