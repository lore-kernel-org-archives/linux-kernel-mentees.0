Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4911D27BF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Sep 2024 02:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726193488; cv=none; b=VcepLQ6MnrcWxBBWmEYvQn/AgQo4F1Bdx3RVkdK3flodqzFuFYnfLtSVUfzjcI66xX7urK/KjNZgw/fM/haikgyKQsCzCbsPZyhXLwyPippriwEYDC9HN9BuNtKzCIGOGWHeg5GlaX/o2J83w5QGvmgAzCcoiJUwXVt8v+2QdpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726193488; c=relaxed/simple;
	bh=+g+iYLsDPMNU1DGfwkevSBUgkSvkrTNSbSdY7kviCWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BftkGDP1w1p7VDaWubUtR0V3msq86rkG5/xMTE+WM7B0rio8/V4uR3WLKnP8LbjZl7tpBO+yUF8TWsjVgu0LVWIeXvVahKaH6QViGJTz+4FGfxeCo/DswvdJsf/gYGgNMLqjGBgmsyLunp1NZ1wmbrebawBqfOxV9MjMSk59AJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpWg/K/u; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpWg/K/u"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B4A280A6B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Sep 2024 02:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufKe_bop5pQ9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Sep 2024 02:11:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7153480A67
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7153480A67
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dpWg/K/u
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7153480A67
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Sep 2024 02:11:25 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-206b9455460so13342225ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 19:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726193484; x=1726798284; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VKXxde7RE5OYjcQSsDvsckGBTQR5Rmzs2NTJhqDpLY0=;
        b=dpWg/K/u2qB7J399k85aOVi51mxyGnr5LNbfIbxSbaxXfPUtlItg9nt+gt7WwgzYZ5
         eftO6y9cJ6JRMX2P6KzOyKRMzj4P7f4Q4EA8SRPLJjduGWKlc7ZjrI8WEF58iBjUe1Iw
         siq/4aWcehBrqTYfUFNnm+cjQ/SG5SaxC8noi0fr60RghGFCB6Jn0Wqkkqc2wT7pD0yK
         gwkckSA8pDdl2j0PZeCmZX8aKNaqsEt3WNRpxrhMLjlKiaQYGnq94g35YrPYiYs66ann
         7sFoXL9a0Z14F+UoHa6+XzM88+6gRpDZ90Vnwn6bAxO9+hRjGkd2lOm/WyEpNIvrkjqy
         4rNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726193484; x=1726798284;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VKXxde7RE5OYjcQSsDvsckGBTQR5Rmzs2NTJhqDpLY0=;
        b=fLHHB6JYm6B/S1+u06ypq1EUaX0UGnna8u5L108yA5ub9gfYY4oSsVPA16y18QwA/f
         +xUFsgi72qAQHFmleJ5N5W2MPt7Cg6cTH9DTVtO4VEO2NZMf0EbFxcJNVVq6xztRKBc6
         1f6R/iGJBYyO5a4LyCxyWjweski5ZXRFd4jTCJQXkitR78BKIuxkRngGhaprheWWF7GK
         6j3JoSmiJAm7PiZMLACDyAZ34OdHzrAjRkh82zzcypU16ftOU6a5fOjYXJzL38vx4MT5
         2RUNlZ3ZTD7ILDC2xsXzxRny8D5GJtGPm9n4jD8Bz8BLq0R8SxxW//Z9nGjNIUAQztK/
         UdLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO8S5ahcBvN+8H2pal4b/+x1+uJLyTZUk7wdHLFYMn3KhprcrGzJkdzlEpMTRS2F3M3PUJmUAsxLyugvc8Np1y9G8TLQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyY2FhyitWTClMvjKl8+gx42wdhYHDCJ/SGtMtefGWntCVbn14f
	sYS6VhkPYDg0fK44Sf0oXYt5rGmFGCwvxL7107lAMXp454UjVsf8
X-Google-Smtp-Source: AGHT+IEqrZCzRb+7n3J3P4T7vXPxWSJssj5ZmpmeBBQjEtUecyl2Bpb6qoxteoq3R1rJwSoV4Mle6A==
X-Received: by 2002:a17:902:f684:b0:1fd:6ca4:f987 with SMTP id d9443c01a7336-2076e592912mr64011855ad.15.1726193484186;
        Thu, 12 Sep 2024 19:11:24 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.229.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af478a6sm19925485ad.102.2024.09.12.19.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 19:11:23 -0700 (PDT)
Date: Fri, 13 Sep 2024 07:41:15 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: "Ricardo B. Marliere" <ricardo.marliere@suse.com>
Cc: gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: Use new initialization api for tasklet
Message-ID: <ZuOfQ9JxL71s2JFx@embed-PC.myguest.virtualbox.org>
References: <20240912172231.369566-1-abhishektamboli9@gmail.com>
 <wpmjgqvxzzowc36wtwxlht23pvvuzdpijhtkiojlayr66cktxp@dnj2ss4fu6x7>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wpmjgqvxzzowc36wtwxlht23pvvuzdpijhtkiojlayr66cktxp@dnj2ss4fu6x7>

Hi Ricardo,
>
> This fails to compile for me:
> 
> In file included from ./include/linux/kernel_stat.h:8,
>                  from ./include/linux/cgroup.h:25,
>                  from ./include/net/netprio_cgroup.h:11,
>                  from ./include/linux/netdevice.h:42,
>                  from drivers/staging/octeon/ethernet-tx.c:10:
> drivers/staging/octeon/ethernet-tx.c:44:52: error: initialization of ‘void (*)(struct tasklet_struct *)’ from incompatible pointer type ‘void (*)(struct tasklet_struct)’ [-Wincompatible-pointer-types]
>    44 | static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
>       |                                                    ^~~~~~~~~~~~~~~~~~~~~
> ./include/linux/interrupt.h:665:21: note: in definition of macro ‘DECLARE_TASKLET’
>   665 |         .callback = _callback,                          \
>       |                     ^~~~~~~~~
> drivers/staging/octeon/ethernet-tx.c:44:52: note: (near initialization for ‘cvm_oct_tx_cleanup_tasklet.<anonymous>.callback’)
>    44 | static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
>       |                                                    ^~~~~~~~~~~~~~~~~~~~~
> ./include/linux/interrupt.h:665:21: note: in definition of macro ‘DECLARE_TASKLET’
>   665 |         .callback = _callback,                          \
>       |                     ^~~~~~~~~
>   CC      mm/memfd.o
>   CC      fs/proc/fd.o
>   CC      fs/jbd2/transaction.o
>   CC      drivers/firmware/efi/libstub/gop.o
> make[5]: *** [scripts/Makefile.build:244: drivers/staging/octeon/ethernet-tx.o] Error 1
> make[4]: *** [scripts/Makefile.build:485: drivers/staging/octeon] Error 2
> make[3]: *** [scripts/Makefile.build:485: drivers/staging] Error 2

Thank you for pointing out the issue. I’ll be more cautious to 
avoid such issues in the future and will resubmit the patch.

Regards,
Abhishek
