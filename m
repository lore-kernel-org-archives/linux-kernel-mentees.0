Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9D6C6FA8F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Aug 2023 02:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66A7660F37;
	Fri, 25 Aug 2023 02:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66A7660F37
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=2nvWZmJz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJPeL9Xyntnf; Fri, 25 Aug 2023 02:57:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6648C60EA1;
	Fri, 25 Aug 2023 02:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6648C60EA1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25CECC0071;
	Fri, 25 Aug 2023 02:57:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC7B2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 02:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82B5783409
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 02:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82B5783409
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=2nvWZmJz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDj-a_KVVR8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 02:56:56 +0000 (UTC)
X-Greylist: delayed 6191 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 25 Aug 2023 02:56:56 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CC9783403
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CC9783403
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 02:56:56 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37OJEKpx016614; Fri, 25 Aug 2023 01:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=IRM7clTLJsFv7y8+IXvQPcdHCoU8AJwOLyxoShZ6Z7Q=;
 b=2nvWZmJzWLP4ad6agOlfDpmembyGqDsNBfdMJ8rmifIf8Nzp56/VQG41L2zHuxpfHqeD
 7Q3uxkSE94VO6mSYU8uLg2uweTqblG9jkmD7CXrYYdhD6Ay7Pc46GrS1VngqSBlURf4X
 4TESlvWlMqTaYj0saW2CquDc4LClBasTAxV5Z2gAPous6nTGX9KhxLe3WUMAPU+ZP9TP
 5R0GitDq1zAPZ3DGdKVeg/ZnOBljLrZUbpy4iAjbZJYmWVlCH9zDogofCFLJ3guuf2Uf
 IK/7CuTeRxL7hgwPE3idFOAulq3QJXHr39nGpOva9B3llkZs8omBX0nQ7p5Vzr5L6o8Y Hg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sn1yvwfua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Aug 2023 01:13:39 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 37OMuKkl036170; Fri, 25 Aug 2023 01:13:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3sn1ywqfjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Aug 2023 01:13:38 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37P1DVE4019787;
 Fri, 25 Aug 2023 01:13:38 GMT
Received: from ca-mkp2.ca.oracle.com.com
 (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.251.135])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3sn1ywqf8n-6; Fri, 25 Aug 2023 01:13:37 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: james.smart@broadcom.com, ram.vegesna@broadcom.com, jejb@linux.ibm.com,
 rdunlap@infradead.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 coolrrsh@gmail.com
Subject: Re: [PATCH v3] scsi: sli4: Remove code duplication
Date: Thu, 24 Aug 2023 21:12:52 -0400
Message-Id: <169292577168.789945.14600068133090244401.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230817114301.17601-1-coolrrsh@gmail.com>
References: <20230817114301.17601-1-coolrrsh@gmail.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_01,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 mlxlogscore=636 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250009
X-Proofpoint-GUID: 0QsdpT99nTfZs8tZTKnjNxT1geXAbs2_
X-Proofpoint-ORIG-GUID: 0QsdpT99nTfZs8tZTKnjNxT1geXAbs2_
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>
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

On Thu, 17 Aug 2023 17:13:01 +0530, coolrrsh@gmail.com wrote:

> In the function sli_xmit_bls_rsp64_wqe, the 'if' and 'else' conditions
> evaluates the same expression and gives same output. Also, params->s_id
> shall not be equal to U32_MAX. Therefore removing the unused code.
> 
> This fixes coccinelle warning such as:
> drivers/scsi/elx/libefc_sli/sli4.c:2320:2-4: WARNING: possible
> condition with no effect (if == else)
> 
> [...]

Applied to 6.6/scsi-queue, thanks!

[1/1] scsi: sli4: Remove code duplication
      https://git.kernel.org/mkp/scsi/c/2d6f70fe175e

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
