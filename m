Return-Path: <SRS0=2tSG=ZM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C28C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Nov 2019 19:45:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E80D420895
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Nov 2019 19:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9aUvXKn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E80D420895
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B60878874C;
	Wed, 20 Nov 2019 19:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aySk2ctxeTxY; Wed, 20 Nov 2019 19:45:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 267E288C13;
	Wed, 20 Nov 2019 19:42:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DB5AC1DD8;
	Wed, 20 Nov 2019 19:42:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65406C18DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Nov 2019 19:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 511EB8865B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Nov 2019 19:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52RpdeITbiql
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Nov 2019 19:42:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4D8C089CF3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Nov 2019 19:40:19 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id v16so406888qvq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Nov 2019 11:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=I0fXLTMBS7epHAtWJ+LPyJS/QsfKSgitSzWNIRgmnqQ=;
 b=S9aUvXKn+Epu0Vq3h9aL1CxtqfV5S1MvnVAGPrqaBgokzHAw2iwoYJnn4FIQeasXDs
 TRIHIhl3vS0S+2D9kKcHss3TBa537A7BkCbNZ6mRphHA5xeonOBzBgVGZpVkyVJEZ915
 O8qfOOK8IX3nOl/KpHEylk7q9XP05pr9RxNLGXUWEznDd9yidC5ncXEJJy19Z7iGD53I
 /uYjcHcNATXWcRg8WSlMHPB9mUTgM9lRQDQ0DgYdvn4D/Lln7DY62KdcI0H7ba04tsWI
 jwvbEBtOPlB9NLdGp5n/nIWWMgfKmZnKLKKbP7GBWlALSkvEMUc15kbEy34OLzRMY60z
 JX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=I0fXLTMBS7epHAtWJ+LPyJS/QsfKSgitSzWNIRgmnqQ=;
 b=mkSYiTFGRqO5SXlCYQhv2HMkd0/6og/b8zvYkgyoN2TE39n3jFvBgHK4hQ0747nXov
 7OU3Bxwpn6yTCL0yXDpUB+q/AwrpzmTMqbSVjXkYF680oJiSMCz01TMm4/muuPrGA2Qi
 Rghye8P0rBr10QhlO9flLc8/IO2fvqLd6GjYjXewixW+yw4/7YlPrp6RgzcVUPTY9ngE
 L0upF7n2iSBs3Sho7H4nOvHNVs5+uQSJHp2FH3K8XpfvX+Kvd5GcjVtZaveZJ5uvLIe6
 CVY2GtTSCU+VPfQlSDa9oQlnwiqS5nL/CIVhuHsyPe72vYcnMtR4cS/+MzqkWWmW4qxj
 ZVkw==
X-Gm-Message-State: APjAAAWx01EB6V6SWB3ijaNK5fDt9Vi3dAGjCdNBiEKdZm2Ey06TPC0r
 bK+AbTLw+PAGNTDI5j8BDfc=
X-Google-Smtp-Source: APXvYqyDVRQETyWJKTrjxINXz/eyzJKAP1HcK5wASbXBCnKakIh32PIB54Uv0RPr4n1oguQttJ3jQw==
X-Received: by 2002:a0c:f4d2:: with SMTP id o18mr4402815qvm.100.1574278818230; 
 Wed, 20 Nov 2019 11:40:18 -0800 (PST)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id w20sm108376qkj.87.2019.11.20.11.40.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Nov 2019 11:40:17 -0800 (PST)
Date: Wed, 20 Nov 2019 16:32:46 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <D28557CA-0019-4FFA-BAA4-9E01AB46F221@getmailspring.com>
In-Reply-To: <20191112085516.15ed4b1a@lwn.net>
References: <20191112085516.15ed4b1a@lwn.net>
X-Mailer: Mailspring
MIME-Version: 1.0
Cc: "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" <linux-kernel@vger.kernel.org>,
 "=?utf-8?Q?linux-doc=40vger.kernel.org?=" <linux-doc@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] Documentation: filesystems:
	convert fuse to RST
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
Content-Type: multipart/mixed; boundary="===============3496701161528171485=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3496701161528171485==
Content-Type: multipart/alternative; boundary="5dd594de_45964b67_865f"

--5dd594de_45964b67_865f
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey Jonathan,

Thanks for taking the time to look at my work. I just sent v2.
Would you please let me know what you think? I can reduce the markup some more if need be.

--5dd594de_45964b67_865f
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hey Jonathan,</div><br><div>Thanks for taking the time to look at my=
 work. I just sent v2. </div><br><div>Would you please let me know what y=
ou think=3F I can reduce the markup some more if need be.</div><br>
--5dd594de_45964b67_865f--


--===============3496701161528171485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3496701161528171485==--

