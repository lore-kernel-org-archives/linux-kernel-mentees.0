Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A120C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 17:15:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E224720657
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 17:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E224720657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5EFD685DA4;
	Tue, 27 Oct 2020 17:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nMub2VkRL4Pn; Tue, 27 Oct 2020 17:15:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 14F3185DB1;
	Tue, 27 Oct 2020 17:15:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2311C0859;
	Tue, 27 Oct 2020 17:15:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5D53C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9F52186199
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLoRwjZkM5-N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:15:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9848A8618F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:15:17 +0000 (UTC)
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id C9F69E427BAEC9A8B06E;
 Tue, 27 Oct 2020 17:15:14 +0000 (GMT)
Received: from [10.47.8.138] (10.47.8.138) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 27 Oct
 2020 17:15:12 +0000
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas
 <bjorn@helgaas.com>, Vaibhav Gupta <vaibhav.varodek@gmail.com>, Adam Radford
 <aradford@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, Adaptec OEM Raid Solutions
 <aacraid@microsemi.com>, Hannes Reinecke <hare@suse.com>, Bradley Grove
 <linuxdrivers@attotech.com>, Don Brace <don.brace@microsemi.com>, James Smart
 <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Kashyap
 Desai <kashyap.desai@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>, 
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, Sathya Prakash
 <sathya.prakash@broadcom.com>, Sreekanth Reddy
 <sreekanth.reddy@broadcom.com>, Suganath Prabu Subramani
 <suganath-prabu.subramani@broadcom.com>, Jack Wang
 <jinpu.wang@cloud.ionos.com>
References: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
 <20201001122511.1075420-14-vaibhavgupta40@gmail.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <6115b301-680b-fb22-ae9e-2dea13b47536@huawei.com>
Date: Tue, 27 Oct 2020 17:11:52 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20201001122511.1075420-14-vaibhavgupta40@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.47.8.138]
X-ClientProxiedBy: lhreml715-chm.china.huawei.com (10.201.108.66) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: linux-scsi@vger.kernel.org, chenxiang <chenxiang66@hisilicon.com>,
 MPT-FusionLinux.pdl@broadcom.com, esc.storagedev@microsemi.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v3 13/28] scsi: hisi_sas_v3_hw:
 use generic power management
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

On 01/10/2020 13:24, Vaibhav Gupta wrote:
> Drivers should do only device-specific jobs. But in general, drivers using
> legacy PCI PM framework for .suspend()/.resume() have to manage many PCI
> PM-related tasks themselves which can be done by PCI Core itself. This
> brings extra load on the driver and it directly calls PCI helper functions
> to handle them.
> 
> Switch to the new generic framework by updating function signatures and
> define a "struct dev_pm_ops" variable to bind PM callbacks. Also, remove
> unnecessary calls to the PCI Helper functions along with the legacy
> .suspend & .resume bindings.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
Hi Vaibhav,

Can you please consider rebasing this series? This driver has had many 
changes in the area of PM for v5.10-rc1

Also please note that my colleague provided a reviewed-by tag for v2, 
so, if no big significant changes from v2->v3, please add that tag. 
Obviously, in light of what I say about recent changes, that is not 
applicable now, but just for future reference.

Thanks,
John

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
