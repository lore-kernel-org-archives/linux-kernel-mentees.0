Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCF7C64E8A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 05:19:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56CA22085B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 05:19:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rXyotlx3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56CA22085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BBFEC86F81;
	Tue,  1 Dec 2020 05:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7oOgPQejZfqg; Tue,  1 Dec 2020 05:19:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE6DB8875C;
	Tue,  1 Dec 2020 05:08:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA6A1C163C;
	Tue,  1 Dec 2020 05:08:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE254C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 05:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DA01386936
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 05:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gWd0T_gsbF9Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 05:08:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6C80C869F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 05:08:20 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B14n0Je096878;
 Tue, 1 Dec 2020 05:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=nQcA6t9MpDEbiXOWAOp80SLIAKub8FrxPUxgJ6qfeEo=;
 b=rXyotlx3QBlW5JnHjIJ+MG3Py21EccTy8QbzHaiDfK19uVOj84RncCRSqvLfVeVaUI8o
 XUnZu9p7apdSP8kH9apk1CUwBCWkh4gIF7B+HULgQ4wwnfRTkIZL+p+KAnlsIuTib5vF
 UYZfIobUEAyxEdgxoAAgaBMXCCMbpGYQuB1MVNp3lcTd6TxoH2aj4iloSUh36guMnGRr
 2dz1xmCHdeUqZFJUgxbCH11VbUi0pGb8VWT2sq3j8YmVbojaLWbDDrIkviO4haT3tw3k
 mjmkhV3oPRKGwIo63YusEra4trFgGdJghOe+al1L7eCRmw9Q1Onstq460s5/dy7rdrOR WQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 353egkgjs6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 05:07:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B14o6ZQ115245;
 Tue, 1 Dec 2020 05:05:51 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 3540exfe3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Dec 2020 05:05:51 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B155cYA022528;
 Tue, 1 Dec 2020 05:05:39 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 30 Nov 2020 21:05:38 -0800
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Bjorn Helgaas <bjorn@helgaas.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Adam Radford <aradford@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 James Smart <james.smart@broadcom.com>, John Garry <john.garry@huawei.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Xiang Chen <chenxiang66@hisilicon.com>, Hannes Reinecke <hare@suse.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 Balsundar P <balsundar.p@microchip.com>,
 Don Brace <don.brace@microsemi.com>,
 Bradley Grove <linuxdrivers@attotech.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>
Date: Tue,  1 Dec 2020 00:05:33 -0500
Message-Id: <160679912429.488.10640505310603291043.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
References: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=835
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010033
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=849 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010033
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v4 00/29] scsi: use generic power
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

On Mon, 2 Nov 2020 22:17:01 +0530, Vaibhav Gupta wrote:

> Linux Kernel Mentee: Remove Legacy Power Management.
> 
> The purpose of this patch series is to upgrade power management in xxxxxxxx
> drivers. This has been done by upgrading .suspend() and .resume() callbacks.
> 
> The upgrade makes sure that the involvement of PCI Core does not change the
> order of operations executed in a driver. Thus, does not change its behavior.
> 
> [...]

Applied to 5.11/scsi-queue, thanks!

[01/29] scsi: megaraid_sas: Drop PCI wakeup calls from .resume
        https://git.kernel.org/mkp/scsi/c/8ed9d987c6d9
[02/29] scsi: megaraid_sas: Use generic power management
        https://git.kernel.org/mkp/scsi/c/977001df0368
[03/29] scsi: megaraid_sas: Update function description
        https://git.kernel.org/mkp/scsi/c/498854102c1c
[04/29] scsi: aacraid: Drop pci_enable_wake() from .resume
        https://git.kernel.org/mkp/scsi/c/7dd222218076
[05/29] scsi: aacraid: Use generic power management
        https://git.kernel.org/mkp/scsi/c/7e380b5c27ea
[06/29] scsi: aic7xxx: Use generic power management
        https://git.kernel.org/mkp/scsi/c/6897b9a177df
[07/29] scsi: aic79xx: Use generic power management
        https://git.kernel.org/mkp/scsi/c/ec199a8df698
[08/29] scsi: arcmsr: Drop PCI wakeup calls from .resume
        https://git.kernel.org/mkp/scsi/c/b7b862d75b49
[09/29] scsi: arcmsr: Use generic power management
        https://git.kernel.org/mkp/scsi/c/756ebbe73fc4
[10/29] scsi: esas2r: Drop PCI Wakeup calls from .resume
        https://git.kernel.org/mkp/scsi/c/996360c141a6
[11/29] scsi: esas2r: Use generic power management
        https://git.kernel.org/mkp/scsi/c/5f2d8c365050
[12/29] scsi: hisi_sas_v3_hw: Drop PCI Wakeup calls from .resume
        https://git.kernel.org/mkp/scsi/c/17b5e4d14837
[13/29] scsi: hisi_sas_v3_hw: Don't use PCI helper functions
        https://git.kernel.org/mkp/scsi/c/027e508aea45
[14/29] scsi: hisi_sas_v3_hw: Remove extra function calls for runtime pm
        https://git.kernel.org/mkp/scsi/c/71c8f15e1dbc
[15/29] scsi: mpt3sas_scsih: Drop PCI Wakeup calls from .resume
        https://git.kernel.org/mkp/scsi/c/eaf148359d00
[16/29] scsi: mpt3sas_scsih: Use generic power management
        https://git.kernel.org/mkp/scsi/c/17287305a526
[17/29] scsi: lpfc: Use generic power management
        https://git.kernel.org/mkp/scsi/c/ef6fa16b5d4a
[18/29] scsi: pm_8001: Drop PCI Wakeup calls from .resume
        https://git.kernel.org/mkp/scsi/c/66aea31a2d26
[19/29] scsi: pm_8001: Use generic power management
        https://git.kernel.org/mkp/scsi/c/47c37c4dbf93
[20/29] scsi: hpsa: Use generic power management
        https://git.kernel.org/mkp/scsi/c/e5b79ebfb854
[21/29] scsi: 3w-9xxx: Drop PCI Wakeup calls from .resume
        https://git.kernel.org/mkp/scsi/c/3a09951ae366
[22/29] scsi: 3w-9xxx: Use generic power management
        https://git.kernel.org/mkp/scsi/c/d53ae6bbeb71
[23/29] scsi: 3w-sas: Drop PCI Wakeup calls from .resume
        https://git.kernel.org/mkp/scsi/c/7ea03ab79e00
[24/29] scsi: 3w-sas: Use generic power management
        https://git.kernel.org/mkp/scsi/c/99769d8d9109
[25/29] scsi: mvumi: Drop PCI Wakeup calls from .resume
        https://git.kernel.org/mkp/scsi/c/bd7463cdbe1a
[26/29] scsi: mvumi: Use generic power management
        https://git.kernel.org/mkp/scsi/c/0572edbc32c5
[27/29] scsi: mvumi: Update function description
        https://git.kernel.org/mkp/scsi/c/53fdec73c14f
[28/29] scsi: pmcraid: Drop PCI Wakeup calls from .resume
        https://git.kernel.org/mkp/scsi/c/0aea8a8f3a77
[29/29] scsi: pmcraid: Use generic power management
        https://git.kernel.org/mkp/scsi/c/ac85cca31637

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
