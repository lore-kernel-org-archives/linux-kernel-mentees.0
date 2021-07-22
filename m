Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA8BC6377D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 13:27:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59ACB61289
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 13:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59ACB61289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 204B960737;
	Thu, 22 Jul 2021 13:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vk9ZJH5SjIGE; Thu, 22 Jul 2021 13:27:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6827E605AD;
	Thu, 22 Jul 2021 13:27:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40DA4C0010;
	Thu, 22 Jul 2021 13:27:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 147CEC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 13:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E1658315C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 13:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxDjlqQAVw-R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 13:27:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61597829EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 13:27:12 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h8so6805855eds.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 06:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LsZENd3pf1xniTb8JiRQ/rWjqej2E7kG3OJy76M5CZI=;
 b=OdGz9tr46gaHf4iS6TGHlpKymFR09C++/U9BnDnj+pjpJ7c682pY6Wztc+1HE0gA8m
 oy5LnKrBglz+Hy6+mXb8kz9POHXczf1NOhlPxygc9ojETVgTWsqT/hJz1uPbU/57Gfsr
 37iQ7Ho2WsBrL+mUryJXn2eElYxRV9deU/AcdqZclSMzPW5m1HWaCVZg5XFReDWZTdXU
 V6C4J+GPN090IQwwRK4WaoKkpvv2mb39314I8m3HDAntKUG8RSgSZNQNVWaLPv9eQU8o
 ZKUk9nhCMF6CNhXPw5bGxaXeBCSqjy59QSTZ81fzp9izzaqc26K47xKD3p+yryzmy+o6
 oalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LsZENd3pf1xniTb8JiRQ/rWjqej2E7kG3OJy76M5CZI=;
 b=NSF0ug4WwISYsfMcsF8NeJBgIjNrGxxjD+m0T9L1KM7NFdBpR6K742XYhMGQjPNoWZ
 i9BVtEKqk5C+fkSl1X330LGXF5AbWI4Jt2dXY3oisYQvDrnS7O8DdYy8eVuFkuvQavdP
 bLdGVBTggRAmikJnhfB8gYE4vZ1RM2LCDOZbH2UZsIRKejJ4CP8wqkvPxqz4tUkj+Fnp
 YTTgcfJP8/vxJBp/VkAqbhB5VMob7ZI6v0n+lT72NGSXk67dzSxhkDiROKxukFPr9aLu
 b4tT/QaJc66s0jGOezxQBW9ZevdaPWoJtQv5VhoRa8MbLyOdocrXwR6VlxM9FQnb/3J1
 7Aag==
X-Gm-Message-State: AOAM5316wS7MZZT/dyRSxGL06wfFYm9RwvSNQE3dOHOphy0D6ng3hhTm
 yl5V7IozpHCCd5vi09hSm4uIYCKom3jNSemS2dwCoX5zDTuIKg==
X-Google-Smtp-Source: ABdhPJxvMqYZLhe6Wzjl/vA+M0sxbzzG5GoXDMrQ+7Ye6ZXUjLniOv234JkfZCbkEtWyBof1xX0e7yLyALGwbQcSTlE=
X-Received: by 2002:a05:6402:14c7:: with SMTP id
 f7mr54916494edx.84.1626960430067; 
 Thu, 22 Jul 2021 06:27:10 -0700 (PDT)
MIME-Version: 1.0
From: Aman Gupta <amanguptaag.00@gmail.com>
Date: Thu, 22 Jul 2021 18:57:00 +0530
Message-ID: <CAPG6wex14w1EfddLZtiNXZVz4BLSh2rm5UJ_ygp1UHOhq0PtrA@mail.gmail.com>
Subject: for participation in linux foundation mentorship program
To: linux-kernel-mentees@lists.linuxfoundation.org
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

I am interested in the Mining Maintainers mentorship program and I
would like to work on the tasks for the mentee selection.

Thanks
Aman Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
