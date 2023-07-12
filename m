Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FD5EB64DA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Jul 2023 15:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6F56409AC;
	Wed, 12 Jul 2023 15:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6F56409AC
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EFG/VXUj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sggf7X1XbCxU; Wed, 12 Jul 2023 15:42:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B1FF440990;
	Wed, 12 Jul 2023 15:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1FF440990
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B0FCC0071;
	Wed, 12 Jul 2023 15:42:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8477C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Jul 2023 15:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B161417C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Jul 2023 15:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B161417C0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=EFG/VXUj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNn0Hn2yGJQ2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Jul 2023 15:42:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FFBE41768
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FFBE41768
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Jul 2023 15:42:34 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fba86f069bso11558107e87.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Jul 2023 08:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689176552; x=1691768552;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rlyvltT+TDsU8aorJ6katMKTRoqeM7opfaR5ApThWtM=;
 b=EFG/VXUjRh4UrfnXYu5nGLwTrAls9lAdWj9WRQqTaVgmLqFpPlijetLYty46AciUYk
 +TYOOi+CjPTCHHO4ZwWVYXuV2yeO6VUh4rkdrQNvxtakVJe6EaLYYDYjHGePsmTfPOry
 WZu+vKUi7ltZIXAld1oH5gheeh8b88JZTWoocV8gZmP7yZYuwj7lLOrwmBIphlN8MrVy
 xlXbBizjbziObo7MLM/LIpXM3/4ynnHOXBnyFIx0SRUjjphP7OBUCdfiaeFvIixpvuLR
 yWc84RGUWZkNqHbJ6p9Fh6S0+zHtmfecql8xJoJPhlA7PknbRXJ8etErJ6z54eeUEUZg
 yTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689176552; x=1691768552;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rlyvltT+TDsU8aorJ6katMKTRoqeM7opfaR5ApThWtM=;
 b=aXqyrUr/WNHdCR7PKYna/cf6BdzEGMAFFy0XAgZX83yQa2jJVX5uLoXtlBAclgdQKT
 aP+bU7MsYSEK1zX2+4JTi2piCDdQ1YZNuxb9TG8AnQh9z2+8tz1RA8Wb6nLFu1WAYDzU
 GPMg7q2VgWGiMMzFvcCuygf/BQU9euA4cNmtsFyfkK3GdJOQ8fOkdMGrAjZ1tRQWe2WQ
 Iir5r97C/dZGwvFDmv5yk0K9e3UdS5oEbb1PT/bvzgh8xE16NbW6Wm171xfizSITj+Mv
 b0TGjXwR07c7hocfG4f8p4GfL3sAWwvJL0CsMFDUbRmzEGlwjktlwpVAp+PQPw0VL6eN
 n8RA==
X-Gm-Message-State: ABy/qLY4xUwnL+ODgYzrET7lO5p2nC9WEPMUEYU4iMR+Iim1msPQEhgV
 6Hq1sOHCDT/IxFbCTJkcf1M=
X-Google-Smtp-Source: APBJJlFh1bdUChwGl7U4vHb1mdJrD+m6UPFPwDryvpr/QaFR5P9DcyKjGaB1u39/J2BwE2Bo+5XyMQ==
X-Received: by 2002:ac2:4f0a:0:b0:4fb:7be5:7404 with SMTP id
 k10-20020ac24f0a000000b004fb7be57404mr18891991lfr.63.1689176552020; 
 Wed, 12 Jul 2023 08:42:32 -0700 (PDT)
Received: from localhost ([165.231.178.23]) by smtp.gmail.com with ESMTPSA id
 d11-20020ac241cb000000b004fbc6a8ad08sm756979lfi.306.2023.07.12.08.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 08:42:31 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 12 Jul 2023 17:42:27 +0200
Message-Id: <CU0B41A94HS4.32OC49OW4W5SW@vincent-arch>
Subject: Re: [PATCH v1] drivers: pci: introduce configurable delay for
 Rockchip PCIe bus scan
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Peter Geis" <pgwipeout@gmail.com>, "Bjorn Helgaas" <helgaas@kernel.org>
X-Mailer: aerc 0.15.1
References: <CSK8M39MQL2C.3S7JO031H0BA2@vincent-arch>
 <ZF7m1npzLZmawT8Y@bhelgaas>
 <CAMdYzYqV72=pQa-U3a2N7MZ2ChBNL74QrxHQLbMZJxiftTK9sA@mail.gmail.com>
In-Reply-To: <CAMdYzYqV72=pQa-U3a2N7MZ2ChBNL74QrxHQLbMZJxiftTK9sA@mail.gmail.com>
Cc: kw@linux.com, heiko@sntech.de, Will Deacon <will@kernel.org>,
 robh@kernel.org, linux-pci@vger.kernel.org, shawn.lin@rock-chips.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, bhelgaas@google.com,
 Robin Murphy <robin.murphy@arm.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org, Dan Johansen <strit@manjaro.org>
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

Hi all,

> Perhaps a hook mechanism that allows drivers to register with the
> serror handler and offer to handle specific errors before the generic
> code causes the system panic?

I have some time to work on it. I'm interested in exploring the 
solution proposed here. However, I would appreciate some guidance 
in understanding how to implement this type of hook to report the error.

Cheers.

Vincent.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
