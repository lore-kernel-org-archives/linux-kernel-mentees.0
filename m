Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFDB1C0DC2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 20:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726171998; cv=none; b=YSqwngXTltWzN2Xhz/ymqNdGSAT0uZoRNmqJD4fY90Yubqc4jWHODHFUhC4zpJOWO6lKic51/iZqSUOKISHM8FTP13pWurjRz8YvDXBbzMoH/WrYpBP0th5hsCW6JRxunTwTbNU6+pRBCe1e5JZcbi2HC6VgAF/5jgtGwQ7HjL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726171998; c=relaxed/simple;
	bh=6okTQsa8rgzwLl9EMROLD96VdwwjEKOOEENsTmnsbU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe0wzkCFNWbX0GrW9luf1iT+CTmu47622XQq3df2m8RWkkSA9gNJ+HduUdb/zgNAnE1WhdCOTZEpZjk7vODZ1uFjfIZI6k61/hr6xSeiAuG1jL2AhNyCrtqJ2RS95zlMCZvc/8KjfKomUIiVNzte/Wm0wSREXJqKjI0MR69BqhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bNQzKKXp; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bNQzKKXp"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C4E6119E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 20:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_Ip3NonOYMe for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Sep 2024 20:13:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=ricardo.marliere@suse.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94F546066D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94F546066D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bNQzKKXp
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 94F546066D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 20:13:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-374c326c638so127346f8f.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 13:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726171993; x=1726776793; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6/HJTiMeQZOHmvpm6Ii84I2SgNaOByjP7wc4AbEy0aE=;
        b=bNQzKKXpjtY2u4SQ2uCZY9timyAFJfl+AqaZ/MTAJgC2zo3piet/RU+ICtMmwz6lYv
         iZMwicyttgD/hms4gCAqs5N8vXNk3lNkUlPOhWxjitHeTaxp99jdKRGrQx0eDXYA9ccn
         dacXYQFDOthWgZTgrVOqNzmR0X2FvDuT4GfEjG2T/N1bAfRoUJR1ulcT1dx9+c22Ia2s
         smBmnlWF2Wr9Z57Q/qG1RYeA2fwTXsvLDJtgamMGRKT8cSU4UOzuDlYNGgqwF8WNEhpX
         O3rpWagVWKGRgdXglMr5pC5trl8RAodxd25HNb0zkuR2SjGjhaj25oHL9yUJ1D4V1aaj
         VzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726171993; x=1726776793;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/HJTiMeQZOHmvpm6Ii84I2SgNaOByjP7wc4AbEy0aE=;
        b=lpN8VHE9hMzTVZKoFg6Jll3ebNyQtqBqC5lCsfHk4HusBVLM2F+BBBpBl9XjLdDkCB
         p8QEWTHRcQuzquITjb3dr20Y7shKae5wGSHkbA3GwRv5J/BmGyy7LHh/MbUVHRAuvhln
         6ynUEelKkBt6iPkCvMpdcJMe2QBiBq+cxQy4IZLXG9L76q4HZk2yi2MboEG7QTbb9t8Y
         7lvHvVoC4TVtarWatt89MxUIjUs15WQX8jkYMp7y6MY2upGMUtomUQlXB3b9yn2lNAEw
         Mqs6WnGTb2/tXjNMWk4EIsEJXb+n2Dwce2I1xt0QNMMwV9fL8ZKXiU9pGC/LRfKNV8NP
         3GVg==
X-Forwarded-Encrypted: i=1; AJvYcCVgXxOoxFtawlGHKiWq/o+jZfrnVBYKldKCbxN8j7N7bpQVXALFkWTbq6ty6iEAsUq6M/9Vk34gJAkzN8NIWorsfr4aPA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxNf4X+qUsaW0dkLN+Tb9DyeJvPzZl2jZbxvOhamsdDE39X/q4D
	rddBq7TFoSwraTGHQxw3DbohA02QMUSwbRQA3Af52xOCgEFSeZmWbpHUCV6JzLY=
X-Google-Smtp-Source: AGHT+IFuESW6u6fBWF/+LEDQ2JIBb+AK4uD5H903pPBCcN1b1sjbV/Ut3OwzKvhomN0NC4gqB+byJA==
X-Received: by 2002:adf:e80d:0:b0:368:3751:de3 with SMTP id ffacd0b85a97d-378d61f1f9emr189043f8f.31.1726171992398;
        Thu, 12 Sep 2024 13:13:12 -0700 (PDT)
Received: from localhost (200-158-197-118.dsl.telesp.net.br. [200.158.197.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af44f91sm17798075ad.63.2024.09.12.13.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 13:13:11 -0700 (PDT)
Date: Thu, 12 Sep 2024 17:13:08 -0300
From: "Ricardo B. Marliere" <ricardo.marliere@suse.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, skhan@linuxfoundation.org, 
	rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: Use new initialization api for tasklet
Message-ID: <wpmjgqvxzzowc36wtwxlht23pvvuzdpijhtkiojlayr66cktxp@dnj2ss4fu6x7>
References: <20240912172231.369566-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240912172231.369566-1-abhishektamboli9@gmail.com>

Hi Abhishek,

On 12 Sep 24 22:52, Abhishek Tamboli wrote:
> Use the new api DECLARE_TASKLET instead of DECLARE_TASKLET_OLD
> introduced in commit 12cc923f1ccc ("tasklet: Introduce new
> initialization API").
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  drivers/staging/octeon/ethernet-tx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
> index bbf33b88bb7c..ae1bac99b461 100644
> --- a/drivers/staging/octeon/ethernet-tx.c
> +++ b/drivers/staging/octeon/ethernet-tx.c
> @@ -40,8 +40,8 @@
>  #define GET_SKBUFF_QOS(skb) 0
>  #endif
>  
> -static void cvm_oct_tx_do_cleanup(unsigned long arg);
> -static DECLARE_TASKLET_OLD(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
> +static void cvm_oct_tx_do_cleanup(struct tasklet_struct clean);
> +static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);

This fails to compile for me:

In file included from ./include/linux/kernel_stat.h:8,
                 from ./include/linux/cgroup.h:25,
                 from ./include/net/netprio_cgroup.h:11,
                 from ./include/linux/netdevice.h:42,
                 from drivers/staging/octeon/ethernet-tx.c:10:
drivers/staging/octeon/ethernet-tx.c:44:52: error: initialization of ‘void (*)(struct tasklet_struct *)’ from incompatible pointer type ‘void (*)(struct tasklet_struct)’ [-Wincompatible-pointer-types]
   44 | static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
      |                                                    ^~~~~~~~~~~~~~~~~~~~~
./include/linux/interrupt.h:665:21: note: in definition of macro ‘DECLARE_TASKLET’
  665 |         .callback = _callback,                          \
      |                     ^~~~~~~~~
drivers/staging/octeon/ethernet-tx.c:44:52: note: (near initialization for ‘cvm_oct_tx_cleanup_tasklet.<anonymous>.callback’)
   44 | static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
      |                                                    ^~~~~~~~~~~~~~~~~~~~~
./include/linux/interrupt.h:665:21: note: in definition of macro ‘DECLARE_TASKLET’
  665 |         .callback = _callback,                          \
      |                     ^~~~~~~~~
  CC      mm/memfd.o
  CC      fs/proc/fd.o
  CC      fs/jbd2/transaction.o
  CC      drivers/firmware/efi/libstub/gop.o
make[5]: *** [scripts/Makefile.build:244: drivers/staging/octeon/ethernet-tx.o] Error 1
make[4]: *** [scripts/Makefile.build:485: drivers/staging/octeon] Error 2
make[3]: *** [scripts/Makefile.build:485: drivers/staging] Error 2


>  
>  /* Maximum number of SKBs to try to free per xmit packet. */
>  #define MAX_SKB_TO_FREE (MAX_OUT_QUEUE_DEPTH * 2)
> @@ -670,7 +670,7 @@ void cvm_oct_tx_shutdown_dev(struct net_device *dev)
>  	}
>  }
>  
> -static void cvm_oct_tx_do_cleanup(unsigned long arg)
> +static void cvm_oct_tx_do_cleanup(struct tasklet_struct clean)
>  {
>  	int port;
>  
> -- 
> 2.34.1
> 
