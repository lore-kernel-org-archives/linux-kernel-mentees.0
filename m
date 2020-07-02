Return-Path: <SRS0=sA50=AN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A74C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 13:23:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64F2920885
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 13:23:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=marvell.com header.i=@marvell.com header.b="dpYuNn8q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64F2920885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=marvell.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 382DD267EF;
	Thu,  2 Jul 2020 13:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwoRxHELb9db; Thu,  2 Jul 2020 13:22:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CB30B2051C;
	Thu,  2 Jul 2020 13:22:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BACE7C0888;
	Thu,  2 Jul 2020 13:22:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F595C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 13:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8E4998A71A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 13:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 346cGrgO9kI7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 13:22:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E3E0B8A6E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 13:22:57 +0000 (UTC)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062DLZtt019972; Thu, 2 Jul 2020 06:22:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pfpt0818;
 bh=6Kwa79/B4oYeiDXtVKCW5HHWsBXKxKO2pXdcKdrUd7I=;
 b=dpYuNn8qAZc1T3BMBlze1uXhh2kD+WhaN5vrHR+4qNAQTWWcT+q1HrIPd3RKSzKwj7GW
 eEhPlZjAMx3aeXX8x2Y4fDQpcBO+w1S7jDv/u9p6JE9gCRfWpoXhEqNIIZUT3u8hu+4S
 /kzFnHqSX9tK6QDzAwKsH65bmEZeWiNmGFdcN3SG4IePOG9aAwETzolR6dCBDobrZWR4
 xs1aRYNPso2Qyyi33Gu09Hziwuwm6LcwWOyEGK8fDdPACDEQ4mA8kHcKNzpiOcaq83aj
 sUY14Wp0jGAkp9DgQmUjJUHgU4AtRF7sX3yDT4j5yFBnT0ENa/f0zJvQEtoYkWcwJxKy fQ== 
Received: from sc-exch02.marvell.com ([199.233.58.182])
 by mx0b-0016f401.pphosted.com with ESMTP id 31x5mnwd53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 06:22:51 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 2 Jul 2020 06:22:49 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 2 Jul 2020 06:22:49 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jul 2020 06:22:49 -0700
Received: from [10.193.54.28] (unknown [10.193.54.28])
 by maili.marvell.com (Postfix) with ESMTP id B6B243F703F;
 Thu,  2 Jul 2020 06:22:45 -0700 (PDT)
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Bjorn Helgaas
 <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "Manish
 Chopra" <manishc@marvell.com>
References: <20200702063632.289959-1-vaibhavgupta40@gmail.com>
 <20200702063632.289959-3-vaibhavgupta40@gmail.com>
From: Igor Russkikh <irusskikh@marvell.com>
Message-ID: <3aa3a243-6e9a-c80d-95d1-9c6a143e7eb4@marvell.com>
Date: Thu, 2 Jul 2020 16:22:44 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0
MIME-Version: 1.0
In-Reply-To: <20200702063632.289959-3-vaibhavgupta40@gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_08:2020-07-02,
 2020-07-02 signatures=0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [EXT] [PATCH v1 2/2] qlcninc: use
	generic power management
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



On 02/07/2020 9:36 am, Vaibhav Gupta wrote:
> External Email
> 
> ----------------------------------------------------------------------
> With legacy PM, drivers themselves were responsible for managing the
> device's power states and takes care of register states. And they use PCI
> helper functions to do it.
> 
> After upgrading to the generic structure, PCI core will take care of
> required tasks and drivers should do only device-specific operations.
> 
> .suspend() calls __qlcnic_shutdown, which then calls qlcnic_82xx_shutdown;
> .resume()  calls __qlcnic_resume,   which then calls qlcnic_82xx_resume;
> 
> Both ...82xx..() are define in
> drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c and are used only in
> drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c.
> 
> Hence upgrade them and remove PCI function calls, like pci_save_state()
> and
> pci_enable_wake(), inside them
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Acked-by: Igor Russkikh <irusskikh@marvell.com>

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
