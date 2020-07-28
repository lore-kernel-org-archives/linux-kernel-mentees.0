Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC9EC433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:41:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAB6020759
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:41:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haoCqu+L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAB6020759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B2825246FD;
	Tue, 28 Jul 2020 12:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GB8k2vI1p1Lt; Tue, 28 Jul 2020 12:41:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 88B4D22F26;
	Tue, 28 Jul 2020 12:41:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7706DC0050;
	Tue, 28 Jul 2020 12:41:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E59EBC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E25788742D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yfjd8WH3vep7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:41:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 84F6886689
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:41:19 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id k1so11521740pjt.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fie8IAXWZ8a1f4IBdyXwUsTRAo2+ebUYgUxfo3SFpeA=;
 b=haoCqu+L8GW/U4OWwDQnTgb9GtXYeSPf/3t+tetw4UjMKCpOcKW9zEnJX+SwLZ17LL
 BW2HDc1XLMcKdoK0p3xutk4REkdxx/RTEqfmqaPQZ6gd3tprs77Fsbv56tzrXJUsfN8H
 2HN8kNTWkCQ0guBjpN74s+oAf3YAehWjQrxT/F3jAFnj7TumR4+r70BFy9ku8o+lHHuk
 MB6HNeuF3yOVbLRmGdHmyRVIVCPQmsygQFILPj9+DOJdZSPJszFKZXjHo/NjsSx2m/we
 i5dvQMD8HdIGLmKHCWiBQPVC/OBk+W+iYpVUP4hifZQHXqgZrgyxzdv3UA0qX6eyLxIV
 7y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fie8IAXWZ8a1f4IBdyXwUsTRAo2+ebUYgUxfo3SFpeA=;
 b=f6c+xrT/Pl0ufE64P/Fr0xq7+y+607phtAjX1P+vBbMqKMKlOfrfo27lPKenMOM6ul
 dB0wGIgnr1HvV/eQKr1E59zyROZs+MHCw5kKCkrxyUYZs4sQS8drndek2lFrXzdLqI73
 zrzXoR/lbyiRxcDGbvMKmJuc/S1QanVidU1XNMKCQSHqrFxcUIP9Irkx4v7tIrg8JJAY
 j/jj3jbAFd9jqP+Wfy2jflshchkC4Vx49WxAn2YV1J2UfyD5SREVXXHXCjjz0WPKdEMP
 b7hM/tb5n+uUAEDt/Ei79QqmdhW+JpBsD9SqmvU1Hua5Q8OB2e2MSksLGHoz6ZWd2gl0
 T+tw==
X-Gm-Message-State: AOAM5309zRSTwN4DfW8T+FhZowaxwNlcBIySLtAsujYIr6bDBUEYFjAh
 Uf0mpSzSznvFTnuCFjSen50=
X-Google-Smtp-Source: ABdhPJyOrg3NwW9cQWlvOe1YfodJHn7NnaR+jSpc77kZqqqtD5XzGFf31FbitFJd5NZAB025aWtEhw==
X-Received: by 2002:a17:90a:ba92:: with SMTP id
 t18mr4267672pjr.121.1595940079182; 
 Tue, 28 Jul 2020 05:41:19 -0700 (PDT)
Received: from gmail.com ([2401:4900:2eef:ca92:3545:4a68:f406:d612])
 by smtp.gmail.com with ESMTPSA id m4sm11387168pgh.9.2020.07.28.05.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 05:41:18 -0700 (PDT)
Date: Tue, 28 Jul 2020 18:09:48 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200728123948.GE1331847@gmail.com>
References: <20200728114128.1218310-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728114128.1218310-1-vaibhavgupta40@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] wireless: airo: use generic
	power management
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

This patch is compile-tested only.

Thanks
Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
