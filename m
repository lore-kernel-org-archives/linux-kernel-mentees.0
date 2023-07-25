Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4A8C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Jul 2023 15:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D0B6080B;
	Tue, 25 Jul 2023 15:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D0B6080B
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Vt0UW/4Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uflwz8pfBnLa; Tue, 25 Jul 2023 15:58:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7E6DD60AE3;
	Tue, 25 Jul 2023 15:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E6DD60AE3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59EA5C0071;
	Tue, 25 Jul 2023 15:58:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6DECC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 15:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F7FC80EA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 15:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F7FC80EA5
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Vt0UW/4Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8LFY5Ge11PA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 15:58:34 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7E4A80E8A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 15:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E4A80E8A
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso83833001fa.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jul 2023 08:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690300712; x=1690905512;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KDPHVmrZzrWaxB7S22eSEgowz0/oT2a8WviPoFNE1Bs=;
 b=Vt0UW/4QXA8r+1Q75QsqTUSZBKefz0fG7HAOqNNwbgocQnJEA7MD9ASaGd7oBshNuN
 yCj4d3f0PFRaGjcRKxH3bpQJeZnt94cPJ7lh1YlfmejOHe4eNTEoBysxpw5JJR2fluyr
 zTGxXYCmWgXYCO5K5SjPolAOy7oRNOGkJIK5OiUj4/mnKFF/0P7DaohTNEh/Vd2n79iF
 GDzkLYY+c5m6k6PaI6OYK9PzmVgQhN8mF8I9BLwfpVzYZAF/ruGnghtJiWr5qHTRAinU
 c+ALgRQ/JSN6oeqGXZWBfWyXI2VTjm25tLWoNoe0lcsl+SedIq/4BX9+MNT2+WVgCXzS
 XZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690300712; x=1690905512;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDPHVmrZzrWaxB7S22eSEgowz0/oT2a8WviPoFNE1Bs=;
 b=P6NH3LeNhmYkRiWsL/9ed0TVuY8z0TAuIdvtbj34X4wWlD5l86GcrbA8qZpCKctB3a
 UapVtveifVknrJnQonLbquSs+iI6JeHptLIjiO46j47CZyfiUIc3DqahS7X6+aF4BbNA
 0DOHn6x4PBXNRzfvuyZ6OinHZlBgcOVba9ewoZepojpmgdZx0Ejd4uDAbOMMIHbfJZGd
 QeMvZP1E1x5840fFeMlaUv3YCvbDKrYYlN/MmH0a51hu6kz4STIylESljZud0OH4WX8K
 sUTWkyouHXtLuDx65W6A9VVBrDECpvicxlq8eOWNO9ZQCltjDxhiWJRiAV21OQ9amOMr
 jM1Q==
X-Gm-Message-State: ABy/qLaktoSHUElqgU6KYP5WKIe+EH89mGZTkInRcGCkkINQTJ0Cpw5O
 vrQILnVqNg0Uid2Vf/1Tfm8=
X-Google-Smtp-Source: APBJJlHErb0hv3zP6dPtwLIEAfOCGmfbWI9JzmdQiVQQd1Mri6bGtnJO7G6Hs6TC2SrbPuI3QVWh0g==
X-Received: by 2002:a2e:8e85:0:b0:2b9:4413:864e with SMTP id
 z5-20020a2e8e85000000b002b94413864emr9655654ljk.53.1690300711655; 
 Tue, 25 Jul 2023 08:58:31 -0700 (PDT)
Received: from akanner-r14. ([77.222.25.78]) by smtp.gmail.com with ESMTPSA id
 x20-20020a2e7c14000000b002b47a15a2eesm3584084ljc.45.2023.07.25.08.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 08:58:31 -0700 (PDT)
Message-ID: <64bff127.2e0a0220.a28fb.62fc@mx.google.com>
X-Google-Original-Message-ID: <ZL/xIm8NS8mBOlWv@akanner-r14.>
Date: Tue, 25 Jul 2023 18:58:26 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jasowang@redhat.com, netdev@vger.kernel.org,
 brouer@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drivers: net: prevent tun_get_user() to exceed xdp
 size limits
References: <20230725153941.653-1-andrew.kanner@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725153941.653-1-andrew.kanner@gmail.com>
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Please, drop it and see [PATCH v3] with the changelog.
git notes were dropped in v2 eventually, sorry.

-- 
Andrew Kanner
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
