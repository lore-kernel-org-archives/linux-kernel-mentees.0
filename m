Return-Path: <SRS0=RvA/=ZN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8569C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Nov 2019 14:03:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9150820679
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Nov 2019 14:03:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrQXNZjN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9150820679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 86AC88650A;
	Thu, 21 Nov 2019 14:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8_AHtRO6Vxn; Thu, 21 Nov 2019 14:03:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F0EF8251D;
	Thu, 21 Nov 2019 14:03:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 039E9C1DD8;
	Thu, 21 Nov 2019 14:03:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D036DC18DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 14:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B4B1F881EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 14:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w+JetAYxnrzZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 14:02:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6366F88393
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 14:02:57 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id i3so1422678qvv.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 06:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=LURzZVLlpvVOqtlgKz7M/23x94tLf6JOsMwc8YgAPjQ=;
 b=UrQXNZjNsoyj5dl87627ZjR+m9fAnqoa5nK8BFPApoJl76cWOq4OUUTapo3S0VGZlE
 MootpQaZdZftOwMf/JQ2LXsaAuqITCJzr2HAOUWLr3gHxlL1xBbebupHmxdgW2H3wwb0
 mNns7aZAp2xaTK7zjYDhmQbmwpui/pPHpbkibKF3nfJpK/N2+rsWXTg/9F54VL77+9YC
 I1CU4e8PiUeB8sDK+RqGR4ww/iotKDEqZoFZ+s1MpBIbOSIRIUS0AN/kXHoqqrzYAZEf
 tLgScUiosnxsd+fYR6CMa2Ct5XPXbB0tIkm8igiWHT0EQyCOWCffdkn85WgBqDgBoIBn
 ztJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=LURzZVLlpvVOqtlgKz7M/23x94tLf6JOsMwc8YgAPjQ=;
 b=FewCM2d7rmX5/PJ5t5NL4p8eMZ1ymXp0knABOCY0aWU6rp+bGnGKEo4yGvHJ433GAF
 N+jJJxbDZov1Dmlm6iky/pPEcs7mJ7zZLtBHPJ5zvRwuz56qXXtuPDwqmBPER7Dmuoc2
 5QTWj6YMSAC3lrShXjfJyFBTWrOEQhxrZi3Gz3292SYx3HJHSMwWI0awWfkkaHerOIvF
 ifmXD7P1YA3r7BoWbJjVZi9RKj0MrSma67AiJOVwmpXaDcuUV3EdHo2EpuyJLpE5u06v
 gR0ro4dJrtxm+6iETrsx/AbAKln+ppe6x0rInOcrc69FBaIzugzlVZkw/c2m8olhcYua
 46ZA==
X-Gm-Message-State: APjAAAX0PoMDyrqTGK+P9x75TCe+rPV4lnARx10QRJL79y7DmMokn5mZ
 Zj0QKZpe8XQ66DNjWeZecnaIscRS7SU=
X-Google-Smtp-Source: APXvYqzq/ZUdG/cbOz0znn9ao2Y2VDCT5Rb01aXNgRwuLUsCdM71CWKKxHdd5JmNyk2mbvTwrks/DQ==
X-Received: by 2002:a05:6214:8d4:: with SMTP id
 da20mr1260708qvb.2.1574344976082; 
 Thu, 21 Nov 2019 06:02:56 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id q34sm1577608qte.50.2019.11.21.06.02.54
 for <linux-kernel-mentees@lists.linuxfoundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 06:02:55 -0800 (PST)
To: linux-kernel-mentees@lists.linuxfoundation.org
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <4eb448bd-312d-6e2f-72f4-47659d7f8c7c@gmail.com>
Date: Thu, 21 Nov 2019 10:55:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Linux-kernel-mentees] I am working on
	Documentation/driver-api/gpio/driver.rst
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hey there!


After browsing the archives for this mailing list I was unable to find 
previous work on Documentation/driver-api/gpio/driver.rst, therefore I 
am working on the documentation warnings for this file.


Thank you.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
