Return-Path: <SRS0=cwSI=GZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3111C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Jan 2021 21:27:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C50523AF8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Jan 2021 21:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C50523AF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D559187239;
	Fri, 22 Jan 2021 21:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfBbgZX8FIhO; Fri, 22 Jan 2021 21:27:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5A60087221;
	Fri, 22 Jan 2021 21:27:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45ABDC08A1;
	Fri, 22 Jan 2021 21:27:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F636C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 21:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 69DDD87221
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 21:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BFr-NjUXiqZX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 21:27:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B9AB68722D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 21:27:23 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id m1so5694800wrq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 13:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=t0zWmpN2U5S9iRjCww+Extb3P4eeoeXLbkv/9S1Hi+Y=;
 b=Z16/CDXvQ9j8+RWR0GVgbAxqrc6TdWmOYTcqZ0dxsrM+alztOKs+ITs2fyAznCkRmF
 UpRxEx3TRnueWvOgKFGJHMesK2k4HczxU6+hoCbWo8+mutDt0JW+y846ybC1K3bimBI5
 K9eIi3nsSjmVjLKH6yiR90QG0jh6lQ/WRD9J94MqPSNj9EUgtYTSGHEqEnXFM63ywl9i
 HbyCvyo9ET6uoPobrNPE/jMCagoAJJjBggzoFz/jz7I2wMsICVitG5ngPdxk10d7antr
 iaBwRUDFB7kzSEkANY2EP9+FT6XJp4KgPfTLLMdxBtNiA1zVvaHy7Mk8Uy8lGB1p2kGU
 C3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=t0zWmpN2U5S9iRjCww+Extb3P4eeoeXLbkv/9S1Hi+Y=;
 b=o+8wTUFNl1NDbZEYE1m0TGL3/Jjunn79Rpn/Elm4RKGWnfxAjCNJ14m8ZXMksVNcZa
 hySDEAQp0XN4hWH3zABtjUsQJWdQWYbkqk48g0T6lEGhm0s1KD5+GOdaWTfVBWGzi8WC
 VQsvYDrlAm6VNhOJ70trI2LOge4gAkR35mgW/rxtNNLQBqyxnlfFawa2AYoXkyABgjVs
 vhFWca7G+ZL9XDZuQ/TuQNaSpIxNrpEz66396X3ZTrBSMiTTZmifiA7TvKgaIe7McnqO
 CuP2VqjSoWaP2quPUGWSYAIWZTELxKLYbgqezMykX3kQFPMpGOvnt9ZWNnmf48D3qfle
 bxXg==
X-Gm-Message-State: AOAM533/hg4DR6Dc7K1XLbG0Ijao268vXoGVf4/4zdIFcjtGjxiimbig
 dRI18tgH/1KxFvk8ZuAOGuaZitlniBOmpqqLd+k=
X-Google-Smtp-Source: ABdhPJyiYoZbQwXTxrqC3CIPMaA8egD+28C5vSgg/T4PAh0xE7yT8k7w4hQnx8cKNGr0Te5H05rNzCgSz4EU7boIB2E=
X-Received: by 2002:a5d:5224:: with SMTP id i4mr1258038wra.123.1611350842166; 
 Fri, 22 Jan 2021 13:27:22 -0800 (PST)
MIME-Version: 1.0
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 23 Jan 2021 02:57:17 +0530
Message-ID: <CABJPP5DZH0=kr6JaE0wv4iC+pq-9YG=SLPE_15jiQ1YnW1_1rg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Addition of verbose mode to checkpatch
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

Hi Lukas and all,
Recently while going through the warnings emitted by checkpatch,
the necessity of a verbose mode came up once again. Joe had
already suggested that a verbose mode would probably be worked
on.

As for how that could be done, that leaves us at a couple of options.
Since writing verbose messages for all warnings aren't possible at once,
there can be an optional extension when emitting messages:

Currently, a warning can be emitted by
WARN("TYPE", "Message")
which could be converted to say:
WARN('TYPE", "Message", "Verbose")

Another way is to leave the original warning emitting syntax intact
and instead go for a dictionary for verbose messages:
our %dict = (
"TYPE1" => "Verbose",
"TYPE2" => "Verbose"
...);

Although this leaves us the ability to customize the verbose output
for each warning of a particular type.

Which do you think would be best? Certainly more options might be
possible, so any new inputs will be nice as well!

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
