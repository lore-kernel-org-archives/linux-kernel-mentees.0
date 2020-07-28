Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A694C433EA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:37:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F0B62074F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 12:37:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHe7dAnw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F0B62074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E68BD8535D;
	Tue, 28 Jul 2020 12:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xwFnO1JaNBVZ; Tue, 28 Jul 2020 12:37:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A140880ED2;
	Tue, 28 Jul 2020 12:37:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 824C9C0050;
	Tue, 28 Jul 2020 12:37:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35B57C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2485D8666F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-Hr0PYxTJ-N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:37:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0EB91853C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 12:37:49 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id ha11so4273118pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fie8IAXWZ8a1f4IBdyXwUsTRAo2+ebUYgUxfo3SFpeA=;
 b=qHe7dAnwegbl8DFADwHo8PEhSZ+7zbY4GEkjbh4YRgoBOr7ttuUIZd3W/lLbgvLXtH
 Nmw48d7CCQlwK/k1SgCBId7AiMOZT4EXk0h2LojeErsKRtc6QPNKwLxAhFQd6hR5NDyh
 9oHwM248bQKXcys1dFKO9l1neCAYAMuaCiwJCWlW/ZkIe96vqwtjeAMSYa2tbq9x3o88
 BGtALXe6t+2pHo3RJtR9tsUzxejGbCniBGGmlSIs46uPSGgc49ttoIf+wh2we7OmML0/
 E/BVTKjEZGGX3/hQPfkvDwAN/xv8xFQbuW6LGOAazLbs95E03Y8rFQJ+pEPZpx4h4qn+
 vIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fie8IAXWZ8a1f4IBdyXwUsTRAo2+ebUYgUxfo3SFpeA=;
 b=RnAKrvQ/reEIR6HVJPsXPvsKmMm+nxwyO4g1npgmMKj56RjVwI5vERhLLtLMP0YNSz
 HRv2QScZ+XoQM0yOsg47AlmvsMp8hktuHrqphLdR+5/ZX2L+uUyqZo0pEVt928Nmzw+f
 HZvX/qFGfNJ19NRZ1tVNrraYm9M8W4/zvCgUbbpPhTLyv1ZmUuxD88Yd0rO9KdoJB1AD
 kU63NBQzr413Pme+Z9rNyJ2mXR5It9APyLpsxIOMsPUHgL89AnL+oHtzCJtKIwREAtkw
 fJZC7gH1KULu3NCazAv5IuNs107c60a86KDNa/JFoBSKPDOLfjd0aKKbi4bR8rpRiw2d
 TlGQ==
X-Gm-Message-State: AOAM5322ZIXnmY7bJYc+B/84PJQNYO0SwYoK2lRHuu6Jz+M/eA+8VD7s
 MW8DmBC9DpW9uxOl1pAJfQk=
X-Google-Smtp-Source: ABdhPJxMwzS10JHnifAZmdNYC8YAZkIcOFzizwBro4Xw8cdcIQLhzKEz7J7HdS2SEjQ2Po+YluXXBg==
X-Received: by 2002:a17:902:7b90:: with SMTP id
 w16mr21425536pll.253.1595939868491; 
 Tue, 28 Jul 2020 05:37:48 -0700 (PDT)
Received: from gmail.com ([2401:4900:2eef:ca92:3545:4a68:f406:d612])
 by smtp.gmail.com with ESMTPSA id l134sm18030158pga.50.2020.07.28.05.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 05:37:47 -0700 (PDT)
Date: Tue, 28 Jul 2020 18:06:19 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>
Message-ID: <20200728123619.GA1331847@gmail.com>
References: <20200728042809.91436-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728042809.91436-1-vaibhavgupta40@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] farsync: use generic power
	management
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
