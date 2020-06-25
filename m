Return-Path: <SRS0=mH9I=AG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDF9C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Jun 2020 16:46:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2EEC20775
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Jun 2020 16:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=marvell.com header.i=@marvell.com header.b="ZO2aUhxB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2EEC20775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=marvell.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7A58687E24;
	Thu, 25 Jun 2020 16:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8WNy+dKefez; Thu, 25 Jun 2020 16:46:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 752B7868F4;
	Thu, 25 Jun 2020 16:46:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59B49C088E;
	Thu, 25 Jun 2020 16:46:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A003C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jun 2020 16:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 75A4586A15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jun 2020 16:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrr0q-hvqrCC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jun 2020 16:46:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com
 [67.231.148.174])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6BF5A869BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jun 2020 16:46:34 +0000 (UTC)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05PGexTv007953; Thu, 25 Jun 2020 09:46:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pfpt0818;
 bh=PMskP27+of0ifwdKo+hHxFTCm0HJN0Am7pIewJiyYx8=;
 b=ZO2aUhxBDtLA4Z15aYe/UZJVtWr4ZFe8kF2J/QqbpPVxxpzg1k5oXPJQLdlDdSlCQFmS
 hr4s8lQW4BDLGUtf3MHix3ByqZfOvLIey/y76Z6tNuBI23L1HcbXmJEm+qsXvAV7nTO5
 ao01B4uxNE8fP5mqj8ASPY+ADgNdJiZ3AFAqWE/1V3t3RPNtm+g/EnxEzp0niY+kPKz+
 yts2fknu+0k4VG0T/K6IaTouyUnz9NbL2GzIL/u9UzxlRGZYQ5MZ9StmHxH829KKZxp6
 1V2ruqoDTqzw98NWSiIOLqD1690JjBz7kRthm34Cv5SKYAcu55uhonRj+187AJJLpGa0 TQ== 
Received: from sc-exch02.marvell.com ([199.233.58.182])
 by mx0a-0016f401.pphosted.com with ESMTP id 31uuqh0mqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 09:46:29 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 25 Jun 2020 09:46:27 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Jun 2020 09:46:27 -0700
Received: from [10.193.39.5] (unknown [10.193.39.5])
 by maili.marvell.com (Postfix) with ESMTP id 969AB3F7040;
 Thu, 25 Jun 2020 09:46:22 -0700 (PDT)
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Bjorn Helgaas
 <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, "David S.
 Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Ariel Elior <aelior@marvell.com>,
 Sudarsana Reddy Kalluru <skalluru@marvell.com>,
 GR-everest-linux-l2 <GR-everest-linux-l2@marvell.com>
References: <20200624175116.67911-1-vaibhavgupta40@gmail.com>
From: Igor Russkikh <irusskikh@marvell.com>
Message-ID: <f685dfe2-9a50-15f5-f94f-c72433f84eb1@marvell.com>
Date: Thu, 25 Jun 2020 19:46:21 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0
MIME-Version: 1.0
In-Reply-To: <20200624175116.67911-1-vaibhavgupta40@gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_11:2020-06-25,
 2020-06-25 signatures=0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [EXT] [PATCH v1] bnx2x: use generic
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



On 24/06/2020 8:51 pm, Vaibhav Gupta wrote:
> External Email
> 
> ----------------------------------------------------------------------
> With legacy PM, drivers themselves were responsible for managing the
> device's power states and takes care of register states.
> 
> After upgrading to the generic structure, PCI core will take care of
> required tasks and drivers should do only device-specific operations.
> 
> The driver was also calling bnx2x_set_power_state() to set the power state
> of the device by changing the device's registers' value. It is no more
> needed.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c  | 15 ++++++---------
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h  |  4 +---
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c |  3 +--
>  3 files changed, 8 insertions(+), 14 deletions(-)

Acked-by: Igor Russkikh <irusskikh@marvell.com>

Sudarsana, could you please give it a short sanity test and report back?

Thanks,
  Igor
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
