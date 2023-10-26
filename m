Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491D2C25B6D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Oct 2023 06:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8C68414EE;
	Thu, 26 Oct 2023 06:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8C68414EE
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mFybrtMY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZF-Gt6Ky7JGM; Thu, 26 Oct 2023 06:02:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5CAF7414EF;
	Thu, 26 Oct 2023 06:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CAF7414EF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43075C0071;
	Thu, 26 Oct 2023 06:02:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 312D0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 06:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09691610E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 06:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09691610E8
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=mFybrtMY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NLYPNMHbkrE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 06:02:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0211610E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 06:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0211610E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698300147; x=1729836147;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RpV5tiEQXcsp7xAk6InD/tYd82u0eWzjxZbIhp2hf+M=;
 b=mFybrtMYLe7bjpB9l7NsZNd7scE78E1JTADadsNxHMOQCX3I8T2iUN8J
 kvFKGZVKNv4BJ+LwnznCy4ll6Ggma0nul2oC2U8fwc7Q2Pq0k/NLz9FZi
 HiTuyh39cJeTg73CiYZw7bBUvA5V7hzU16u8fVLgZbUOevovjASzLLr6Q
 N9QHLZhdBUajFGrF5fdtxCzNyJOPuhoxN7t9FA+JR8dQRDvgm8zVR8Jfo
 VN2dw3VRP3wLY9m8MRQM2DSQKe+rngP/Gd65sIUatnAE72D0eeFyFBZmi
 DA2vwCemXqY/07e4/dZfGE3cwFyfjYeAFFk7FG/tSqHJ9hTwVAzWXnOhB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="9023485"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="9023485"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 23:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="708948563"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="708948563"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 23:02:24 -0700
Date: Thu, 26 Oct 2023 08:02:22 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] accel/ivpu: Delete the TODO file
Message-ID: <20231026060222.GA1024364@linux.intel.com>
References: <ZTAucrOT69/tQK2o@runicha.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZTAucrOT69/tQK2o@runicha.com>
Cc: Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
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

On Thu, Oct 19, 2023 at 12:43:54AM +0530, Deepak R Varma wrote:
> The work items listed in the TODO file of this driver file are either
> completed or dropped. The file is no more significant according
> to the maintainers. Hence removing it from the sources.
> 
> Suggested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
Applied to drm-misc-next

Thanks
Stanislaw

> ---
>  drivers/accel/ivpu/TODO | 11 -----------
>  1 file changed, 11 deletions(-)
>  delete mode 100644 drivers/accel/ivpu/TODO
> 
> diff --git a/drivers/accel/ivpu/TODO b/drivers/accel/ivpu/TODO
> deleted file mode 100644
> index 9077217ae10f..000000000000
> --- a/drivers/accel/ivpu/TODO
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -- Move to threaded_irqs to mitigate potential infinite loop in ivpu_ipc_irq_handler()
> -- Implement support for BLOB IDs
> -- Add debugfs support to improve debugging and testing
> -- Add tracing events for performance debugging
> -- Implement HW based scheduling support
> -- Use syncobjs for submit/sync
> -- Refactor IPC protocol to improve message latency
> -- Implement BO cache and MADVISE IOCTL
> -- Add support for user allocated buffers using prime import and dma-buf heaps
> -- Refactor struct ivpu_bo to use struct drm_gem_shmem_object
> -- Add driver/device documentation
> --
> 2.39.2
> 
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
