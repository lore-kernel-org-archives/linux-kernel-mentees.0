Return-Path: <SRS0=YUr9=HD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E232C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Feb 2021 16:34:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93A3A60235
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Feb 2021 16:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93A3A60235
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E73C854B4;
	Mon,  1 Feb 2021 16:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-xIPRxGY7Eq; Mon,  1 Feb 2021 16:34:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E4F3485450;
	Mon,  1 Feb 2021 16:34:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E11A4C0174;
	Mon,  1 Feb 2021 16:34:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D240AC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 16:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BD5B08527F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 16:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uyvuuJrIGYpu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 16:34:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E68AD84F69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 16:34:03 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id a12so23658472lfb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 01 Feb 2021 08:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=sTjaV842e3lQQ0QyQx1MRefCi3psMAfvcNsMB4upxRU=;
 b=XHwHl+aCytpgITGPXjPcD3MEGGf9pUL11XwiSrKTWIQU5bpB0XH9/40g7y5iItD4Tx
 MKbKoe4lfV0hQeBJoaN3HP3RMbnB63qMBOMWErgoyZ9y17WKFJESYBC+xRfiXd0XiBXN
 /NI3gDJhrC60EIjfvYsvYwdULQZkuOlJNQZ7QM35Ri7VCEb10nuv/ZLMsLBNI6kcu+p+
 f/inB7pfzQYITrcxHs69hM+8P99gRuFKjZBRkqOBR9wsW669FPuR2DjELW/MpDB2fSS5
 vjVsmqpyNpR6XgiFa9WA0o0PCGD8dJvLTHuIicArktCF5kIniwjzm0M6gFGj4e+YR/ip
 r5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sTjaV842e3lQQ0QyQx1MRefCi3psMAfvcNsMB4upxRU=;
 b=qSm/QgP/vtmkaqbUnKViCXlbkb0BCVjlXgK+64HdvYUDpDsvTXyaKXyp71E4hBiqiA
 cMyD7aO5TkzjsWlAajwcb3B+UkYbOmrTg1qp0fKQpq2VC80M2aoQbMlccGiJx0uZGbcg
 Tc5++ZmnhrgFxRhsxPOWVnRCDCgTg3de+5CoD5unynfo9+mT2uYlPRurd3ZU05L9WLo1
 wHFpWmrfPHQhdykW+NBiUQlBb2RsRP5eEseDVBB6q398HZtQoU6e2O9exybYdVDl2rDy
 6a2M6ixYEK5W+yR6AOHg8Ht/Hc/upg7AJhbPCBc/bkwZkIfcNA22ZWnBs+ytIm7IT7l2
 Msww==
X-Gm-Message-State: AOAM530JUriIwna1ovf2pEFjqhG+c4aZQEwyMPIAo3jFZeFzcga+mPoi
 ZjpKrH1jOmIYIwizp1v61mRpwVoC4mti/JaAmnA=
X-Google-Smtp-Source: ABdhPJwFbmiYLyfj98WwXePFDVTifmSXWyvUKQ5JYfG/iLSGNia7UWB8T6rEOai0cF+VDbxXY0nluvzPVc3iWI8vPuE=
X-Received: by 2002:a05:6512:3748:: with SMTP id
 a8mr8694093lfs.31.1612197242078; 
 Mon, 01 Feb 2021 08:34:02 -0800 (PST)
MIME-Version: 1.0
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 1 Feb 2021 22:04:01 +0530
Message-ID: <CABJPP5AxB8-kafFEpsMydg8eMx8bH5ooT5g7r0fKWV2T2Hjtng@mail.gmail.com>
To: Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [Linux-kernel-mentees] Patches from the future - can checkpatch
	help?
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

Hi,
on linux-next,
$ git log --pretty=format:"%h%x09%ad" | awk '$6>2021 {print $1}'
gives:
4a2d78822fdf
12ca45fea91c
09f2724a786f

These are patches from the year 2085, 2037 and 2030 respectively.

Would a checkpatch rule be helpful for these or are they too
isolated to waste runtime on?

Thanks!
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
