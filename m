Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E73C0018A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Nov 2023 11:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F4A28239A;
	Mon,  6 Nov 2023 11:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F4A28239A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nkMz/4FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o5p3w5isaBbq; Mon,  6 Nov 2023 11:23:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 668FF8219E;
	Mon,  6 Nov 2023 11:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 668FF8219E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5166CC0071;
	Mon,  6 Nov 2023 11:23:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E3A8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 11:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CFC9821A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 11:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CFC9821A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FiZ-aZXTbhV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 11:23:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AE6B8219E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 11:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE6B8219E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269804; x=1730805804;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mHD5i5vDa1OTKSAAbvoZP2HSropGa5tKX66nmBUNaYk=;
 b=nkMz/4FFh4Ba7sYUKGTZa9jBJURW0HwzrtPcRTgZqztDnJmZlP3MVtFu
 ih+yPi4jN2pwaLJvyI42kZkVH/DE2alKHmRucfodEfA9iMvp6j/9ftmtl
 NrunmPGthAQOH8RkkCZNeIKti7hrP+S61TTBZk8rBtu9qP+owTrcbkrBH
 pIwilIlZnpahu/nPzSyqCwSoKfg1TDkZrzZEg80GtwcZaJ6I6Aedij4nD
 RaOSNEBR5gWzB2EVKsmH2FEyi22klhotoIUuBdmvvL8agE60BLsyvgOCi
 JacrAbC2P3qbOKJBFYgxumsEVANdpHPpCfEbvK4BIMMGaXWhEueHrRs6a A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393150986"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="393150986"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:23:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="3597494"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.222])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:23:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
In-Reply-To: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
Date: Mon, 06 Nov 2023 13:23:14 +0200
Message-ID: <87sf5jyvkt.fsf@intel.com>
MIME-Version: 1.0
Cc: Abhinav Singh <singhabhinav9051571833@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, 03 Nov 2023, Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:
> sparse static analysis tools generate a warning with this message
> "Using plain integer as NULL pointer". In this case this warning is
> being shown because we are trying to intialize a pointer to NULL using
> integer value 0.
>
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
>  drivers/gpu/drm/radeon/clearstate_evergreen.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/clearstate_evergreen.h b/drivers/gpu/drm/radeon/clearstate_evergreen.h
> index 63a1ffbb3ced..3b645558f133 100644
> --- a/drivers/gpu/drm/radeon/clearstate_evergreen.h
> +++ b/drivers/gpu/drm/radeon/clearstate_evergreen.h
> @@ -1049,7 +1049,7 @@ static const struct cs_extent_def SECT_CONTEXT_defs[] =
>      {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
>      {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
>      {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
> -    { 0, 0, 0 }
> +    { NULL, 0, 0 }

Random drive-by comment:

I'd just use {} as the sentinel.

BR,
Jani.

>  };
>  static const u32 SECT_CLEAR_def_1[] =
>  {
> @@ -1060,7 +1060,7 @@ static const u32 SECT_CLEAR_def_1[] =
>  static const struct cs_extent_def SECT_CLEAR_defs[] =
>  {
>      {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
> -    { 0, 0, 0 }
> +    { NULL, 0, 0 }
>  };
>  static const u32 SECT_CTRLCONST_def_1[] =
>  {
> @@ -1070,11 +1070,11 @@ static const u32 SECT_CTRLCONST_def_1[] =
>  static const struct cs_extent_def SECT_CTRLCONST_defs[] =
>  {
>      {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
> -    { 0, 0, 0 }
> +    { NULL, 0, 0 }
>  };
>  static const struct cs_section_def evergreen_cs_data[] = {
>      { SECT_CONTEXT_defs, SECT_CONTEXT },
>      { SECT_CLEAR_defs, SECT_CLEAR },
>      { SECT_CTRLCONST_defs, SECT_CTRLCONST },
> -    { 0, SECT_NONE }
> +    { NULL, SECT_NONE }
>  };
> --
> 2.39.2
>

-- 
Jani Nikula, Intel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
