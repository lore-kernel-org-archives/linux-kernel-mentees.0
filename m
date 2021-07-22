Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C31C6377D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 13:55:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EE5561244
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 13:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EE5561244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 199D74014A;
	Thu, 22 Jul 2021 13:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sl53BraIkiUQ; Thu, 22 Jul 2021 13:55:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 06B59400DF;
	Thu, 22 Jul 2021 13:55:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0FDDC0010;
	Thu, 22 Jul 2021 13:55:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77F30C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 13:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72BE14035B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 13:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id acRO8YSGPQdP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 13:55:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A56B40306
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 13:55:25 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id k16so6399921ios.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2yc+jdweVm4gQnbsD1UvfVv9y5oPU6cSfPHtEgBULIk=;
 b=KRYYqRtgDF5Jceu8YqFtih8KDUvXmYVYQjI/geU40NUg1WeeXcCPKB0n5voWSzDHYl
 AsnDKHIJMxSAHJNheoqmRQS6yQqpAPxVvLuYPk3CnkY+1W85t7Dc8/XyEYAV8y1SmfM9
 iUcQNO1Nzite3EvJ7BYuhi9SndcxgV/0CI7o4hQb5SRRbnRtbwwx8XEvvhxyrzWsjrPj
 bKYISuCLFCJvjPs7JgFSTP707goG8vPV/Na4DVTDZE5/cMV62D/WOn6R86pcJZ+DvgQL
 9oe+dSgotkVJfXpLCTlmTV/fWANSxRxpYJfFWZ9TH6wqje2NIof6sq0gZ6iNy55s9hzp
 Ifqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2yc+jdweVm4gQnbsD1UvfVv9y5oPU6cSfPHtEgBULIk=;
 b=Jg4gFHpUJ4UHmEYHeJp3LBjupNXY50dNBA8BnHgx2D9EDUDi0FYpdTdcIX6335KV31
 5Jb0zH3t2egEk6Lvi1EU8n7Mz/2kNrvIuGgwNeY+n4bBrf5+Uudjio5BocicdBPzfaeD
 XepXr1R+5+BDGwK6v1pjXm78dpvoXZvCIYKVOysBKOFygvBzFf+eT1iWT/i92kq/zZOz
 rRt3I49LxQ1JUN7JJ2cbEeeFDYxxlxlKxT4jp1KBd0hHOOQbDw17ad0NYIgrO4U8KBMu
 5npqpYtEvfLJV3JHBuZkBgFlwSs2nD70sYB/j5gz0Sy3PeYgGSTpo8NXJJm0ZBREzWdQ
 5K+w==
X-Gm-Message-State: AOAM532nhxeILHE9gLF1SpYIa7ZccPmxINciVNVwoTwWDh72sM62y7uk
 lxKG1jG1TA4AJN2RWscPlB/jAjAF1GSX4cwO8gKT2JusyeKnSw==
X-Google-Smtp-Source: ABdhPJxjRV8vAuXN0iiTs72DzyjBwEVwZx2/CeK6iskijIi4w26EXNLlPQ/EYsfKZATLZz9eFOAUYzA3lKM1YNiRl94=
X-Received: by 2002:a6b:7702:: with SMTP id n2mr30937051iom.1.1626962124342;
 Thu, 22 Jul 2021 06:55:24 -0700 (PDT)
MIME-Version: 1.0
From: Saptarshi Patra <saptarshi.patra.22@gmail.com>
Date: Thu, 22 Jul 2021 19:25:13 +0530
Message-ID: <CAJKmYetquiV0LcNFNRRHiX0d=c9hXNtQ2oYvOEEpGZqZpxvphg@mail.gmail.com>
Subject: Linux Kernel: Mining for Maintainers
To: linux-kernel-mentees@lists.linuxfoundation.org, lukas.bulwahn@gmail.com
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
Content-Type: multipart/mixed; boundary="===============3232423054269223303=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3232423054269223303==
Content-Type: multipart/alternative; boundary="0000000000007c073405c7b6a348"

--0000000000007c073405c7b6a348
Content-Type: text/plain; charset="UTF-8"

Respected sir,

I am very interested in the Mining Maintainers mentorship program and I
would like to work on the tasks for the mentee selection.
Sincerely,

Saptarshi Patra

--0000000000007c073405c7b6a348
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Respected sir,</div><div><br></div><div>I am very int=
erested in the Mining Maintainers mentorship program and I would like to wo=
rk on the tasks for the mentee selection.</div><div>Sincerely,</div><div><b=
r></div><div>Saptarshi Patra<br></div></div>

--0000000000007c073405c7b6a348--

--===============3232423054269223303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3232423054269223303==--
