Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106BDEB8FDD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Sep 2023 14:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BC8E404AF;
	Wed,  6 Sep 2023 14:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BC8E404AF
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=claudiocambra.com header.i=@claudiocambra.com header.a=rsa-sha256 header.s=sig1 header.b=r7T0POPV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N26EKlKNA5cu; Wed,  6 Sep 2023 14:38:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 59A754046D;
	Wed,  6 Sep 2023 14:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59A754046D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 361E7C0071;
	Wed,  6 Sep 2023 14:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B06B8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Sep 2023 14:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DCD4820FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Sep 2023 14:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DCD4820FD
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=claudiocambra.com header.i=@claudiocambra.com
 header.a=rsa-sha256 header.s=sig1 header.b=r7T0POPV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESvYuTTegsZa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Sep 2023 14:38:28 +0000 (UTC)
Received: from pv50p00im-zteg10011401.me.com (pv50p00im-zteg10011401.me.com
 [17.58.6.41]) by smtp1.osuosl.org (Postfix) with ESMTPS id 5E770820FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Sep 2023 14:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E770820FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=claudiocambra.com;
 s=sig1; t=1694010765;
 bh=cdH2TirNO5ueRwo8QJsKy5oOekpcUmw8wn9FTzQ22E0=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 b=r7T0POPVFL4NJiYNWh4f/N5/SAFxxzgmFlJAHGKRLAcpeCR52s7IMAb2tZghmzcnI
 fqPrelfxaJON+HP8ufGrLcp/ULkJXTP3T6sn7CUm4pyfhMfzZ+QbA5mXBiruSKPlyP
 2zj06LPHVXiI8SBrq4GOiUtKMNIExdI9fDb4+oNjCJKapWvvcQc9UfpA+YDbVf48qG
 lxRfzRi7Jk3t39/KueoEUhj3ITr0MdaNIV2F66NVd6DhJrTcLO1Z0XqQ0L0IcJFanv
 GtfpghUU0Hh+axo4pdxbUURrLo1aJItHGWf1pTEOS+J2WyiIaunjMauE+HBh+FAWT1
 kt/XC2nbT7dDA==
Received: from [172.20.10.2] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-zteg10011401.me.com (Postfix) with ESMTPSA id 4DD05DC022F;
 Wed,  6 Sep 2023 14:32:42 +0000 (UTC)
Message-ID: <0c629825-2a70-4b79-b4df-12e826297664@claudiocambra.com>
Date: Wed, 6 Sep 2023 22:32:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/gpu: fix docs compile error for i915
Content-Language: en-GB
To: skhan@linuxfoundation.org, ivan.orlov0322@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20230906142746.93411-2-developer@claudiocambra.com>
From: Claudio Cambra <developer@claudiocambra.com>
In-Reply-To: <20230906142746.93411-2-developer@claudiocambra.com>
X-Proofpoint-ORIG-GUID: i63t-a_iJZ5NZfizd2TrqZegsTIPgzWf
X-Proofpoint-GUID: i63t-a_iJZ5NZfizd2TrqZegsTIPgzWf
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 clxscore=1030
 malwarescore=0 suspectscore=0 mlxlogscore=534 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2309060126
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

Apologies, saw this has already been fixed, please disregard

Claudio

On 6/9/23 22:27, Claudio Cambra wrote:
> Compile error was caused by improper doc comment whitespacing
>
> Extra task for "Documentation task"
> Linux kernel Bug Fixing Fall Unpaid 2023
>
> Signed-off-by: Claudio Cambra <developer@claudiocambra.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index ddd146265beb..fa70defcb5b2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -26,6 +26,7 @@
>    * The kernel driver is only responsible for loading the HuC firmware and
>    * triggering its security authentication. This is done differently depending
>    * on the platform:
> + *
>    * - older platforms (from Gen9 to most Gen12s): the load is performed via DMA
>    *   and the authentication via GuC
>    * - DG2: load and authentication are both performed via GSC.
> @@ -33,6 +34,7 @@
>    *   not-DG2 older platforms), while the authentication is done in 2-steps,
>    *   a first auth for clear-media workloads via GuC and a second one for all
>    *   workloads via GSC.
> + *
>    * On platforms where the GuC does the authentication, to correctly do so the
>    * HuC binary must be loaded before the GuC one.
>    * Loading the HuC is optional; however, not using the HuC might negatively
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
