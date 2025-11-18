Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3274B3009CA
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 16:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484238; cv=none; b=uIptvplcijoMGtDLOLxOoi2kMIeR0gt2ytxBRLEOXyo/um0mH0T9FDxtJdROS/3PRwwpCs/UZ3x/H59y/lzmTqAgB3UbnLK4FEx8cyTFogFGUUvSeqDrllv6pLcSRvKW7+MnMgXk0JXR816xr8clFY/P7RlxrO/zl6CGvERvvuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484238; c=relaxed/simple;
	bh=+LVgUS9kVeC/8nV+dll5f40MSzzK5octAcI+dvskmzI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DjywGJgRydOJ+kUwI4fwe9mz78jAupbpwdy+4CIRbepvxCd+5Hi6pm+sQ2GbX1Ivvm8Xwn+5cxMA+bLzJovKgmsjPB+s3XtOQcjrQ1gLB82xy9swoAtXWBMg0st/p6BS2jfly1JxnN9x9EfoyGeoF1fkXmyV/QdvkergQy9vWzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsJzhtK0; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsJzhtK0"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3434700be69so7678804a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 08:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763484235; x=1764089035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+cbuphPFMfLGo5gRI8NR3opiZSQijI8mGuMttNZYVmU=;
        b=hsJzhtK0WXSRQP72UtFw5GNoYoLHaYY6s1DqZf3VF8z80nXqDThxCLLZ87UlB2KHfq
         4Fq6R4tGXwmFxEeWzNxKSPDMg/U6fuRoAN3VXiczivY8w7/oPzs6mtvbcNLPgtlbDxme
         wVaUcmO90Wvf+D6qr5TB/ki8b1ymyA6WSiUE+fo+CzVwLMuNCKYGKkZQ0vLiZ4yG2QN1
         hMGlVZR4swGrjcZEdo6oiGbkqk/pF+QBLQ2vnQ4biyKQ5SHsd+gfGHpgmKIeewx/ahp6
         jS9sckci/6F6jOFybl8bU2LXmUK3/nzXPaSgZr4ytGtLdBNL8bYe1cXJ2SOmTPsuXsIb
         lByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763484235; x=1764089035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cbuphPFMfLGo5gRI8NR3opiZSQijI8mGuMttNZYVmU=;
        b=okS8z1vRKcyV01gdPjCx2DUFey2vXWUV+5noiPYLlKzCSKMiRi+k2OtAr8tSuINpz7
         dyPSJ53Xe/FkkWVeQ30Al7XfegzsACQz/rxMYiPeT9SuldJpzF7zjcXn9qlliwG6vYY0
         6C4wxSQ1E4aNbBqlU9L7Sikxzo4YlH4gubSle0BdME/TvScl0aE9SbKJ0tNkwz/N2q1t
         s0kMWEjiaspHK+n5vmarO1wP2EJkmicGZOlD4Tkk11ng9edsf98Z3htEQAuUsnrt8n25
         +bx15KMTwJGpQGvyLW0azABjMCRBKcEtrqvFD0ln1Gt3/UpwMBnoIH7RYiuxPdgUrSZ7
         VShQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdPjP7bdAyK3gQP9XKTfVMW36VoSzKfTXqG/IOHU1cV9wTNatv6X0nH6bUNJscTk9c1tlR/CF9+VnIWo7ehHdMbyVKJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUiUCvXnwfKKG+u25IBgGY2WfTDEAq0zNWgQrNdVxdJBjfiCU7
	tDxJpyCzBAhtYSNi/JU5gPmGhC3fIiEY4mZ3zU60LxLkCR+8bHj/cFr1
X-Gm-Gg: ASbGncspZ/4VjhOYBPgpyBqxbOAqYX245lFJCJdhWZTkrYa6N+2oC5AmK1/mL8SAf1+
	4VHElCsJsG2wls++eL6yjFTb6gs6H0fz5x+EqRzTvlOo2HSkfOJBjE40BWadPNJ+A9FXlC4pM4I
	EoBvcjOEZ8KpXCsYy9me6gAQ1Flqb2ESx5W/2QvTpsukVxxKCWUXmDdUtAd2G2GtVqXC3J7jBNO
	2Aj4e3Pl2wjhFFLaQrdkxZRSMVX/1hRGUtwVuhjLAv6/H6crEziVQJdNVKjfWLXpjyRg7N4lU5A
	E6eGKWdzWnQ51I2uUaNIEMbHtyKImYfcy2ajBtTU6xKuJeTc0TA6S7jQJu0NrrfLyvx7D30FcI0
	ad16ZsVUDBi+RiMMpjCF54Bh6bgfo4q+dZqgQxaTpbAfdAoIv/HTzt+Z0ErCMIL0Qs9FiuvdNkb
	uVOtOL4sb102PIG5lc7DUYidLULh3cRUf7J7qZUv0KK9Lak4a6K3oldg==
X-Google-Smtp-Source: AGHT+IF4ROlWaR4DHJA0c22lYuFIfvzSSI1ABiWieRYUfZCEK44GiWIPsQat/bJg64jdJOCTUQirsg==
X-Received: by 2002:a17:90b:4a4f:b0:33b:ba55:f5eb with SMTP id 98e67ed59e1d1-343f9d91d06mr16086393a91.1.1763484235218;
        Tue, 18 Nov 2025 08:43:55 -0800 (PST)
Received: from COB-LTR7HP24-497.domain.name ([223.185.135.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456513f162sm13544843a91.8.2025.11.18.08.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:43:54 -0800 (PST)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	mst@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	sdf@fomichev.me,
	kuniyu@google.com,
	skhawaja@google.com,
	aleksander.lobakin@intel.com
Cc: virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [RFT net-next v4 0/2] net: Split ndo_set_rx_mode into snapshot and deferred write
Date: Tue, 18 Nov 2025 22:13:31 +0530
Message-Id: <20251118164333.24842-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an implementation of the idea provided by Jakub here

https://lore.kernel.org/netdev/20250923163727.5e97abdb@kernel.org/

ndo_set_rx_mode is problematic because it cannot sleep. 

To address this, this series proposes dividing the concept of setting
rx_mode into 2 stages: snapshot and deferred I/O. To achieve this, we
reinterpret set_rx_mode and add create a new ndo write_rx_mode as
explained below:

The new set_rx_mode will be responsible for customizing the rx_mode
snapshot which will be used by write_rx_mode to update the hardware

In brief, the new flow looks something like:

prepare_rx_mode():
    ndo_set_rx_mode();
    ready_snapshot();

write_rx_mode():
    commit_and_use_snapshot();
    ndo_write_rx_mode();

write_rx_mode() is called from a work item and doesn't hold the 
netif_addr_lock lock during ndo_write_rx_mode() making it sleepable
in that section.

This model should work correctly if the following conditions hold:

1. write_rx_mode should use the rx_mode set by the most recent
    call to prepare_rx_mode before its execution.

2. If a prepare_rx_mode call happens during execution of write_rx_mode,
    write_rx_mode should be rescheduled.

3. All calls to modify rx_mode should pass through the prepare_rx_mode +
    schedule write_rx_mode execution flow. netif_rx_mode_schedule_work 
    has been implemented in core for this.

1 and 2 are guaranteed because of the properties of work queues

Drivers need to ensure 3

To use this model, a driver needs to implement the
ndo_write_rx_mode callback, change the set_rx_mode callback
appropriately and replace all calls to modify rx mode with
netif_rx_mode_schedule_work

---

Questions I have:

1) Would there ever be a situation in which you will have to wait for 
I/O to complete in a call to set_rx_mode before proceeding further? 
That is, Does netif_rx_mode_schedule_work need the flush argument?

2) Does priv_ptr in netif_rx_mode_config make sense? For virtio_net, 
I can get the vi pointer by doing netdev_priv(dev) and 
am wondering if this would be a common thing

3) From a previous discussion: 
https://lore.kernel.org/netdev/417c677f-268a-4163-b07e-deea8f9b9b40@intel.com/

On Thu, 23 Oct 2025 at 05:16, Jacob Keller  wrote:
> Is there any mechanism to make this guarantee either implemented or at
> least verified by the core? If not that, what about some sort of way to
> lint driver code and make sure its correct?

I am not sure how to automate this but basically we need warnings to be generated
when the the set_rx_mode implementations are called normally in code (From my 
understanding, usually in the open callback or the timeout function) but not when 
they are called through ops->set_rx_mode. Can Coccinelle do something like this?

v1:
Link: https://lore.kernel.org/netdev/20251020134857.5820-1-viswanathiyyappan@gmail.com/

v2:
- Exported set_and_schedule_rx_config as a symbol for use in modules
- Fixed incorrect cleanup for the case of rx_work alloc failing in alloc_netdev_mqs
- Removed the locked version (cp_set_rx_mode) and renamed __cp_set_rx_mode to cp_set_rx_mode
Link: https://lore.kernel.org/netdev/20251026175445.1519537-1-viswanathiyyappan@gmail.com/

v3:
- Added RFT tag
- Corrected mangled patch
Link: https://lore.kernel.org/netdev/20251028174222.1739954-1-viswanathiyyappan@gmail.com/

v4:
- Completely reworked the snapshot mechanism as per v3 comments
- Implemented the callback for virtio-net instead of 8139cp driver
- Removed RFC tag

I Viswanath (2):
  net: refactor set_rx_mode into snapshot and deferred I/O
  virtio-net: Implement ndO_write_rx_mode callback

 drivers/net/virtio_net.c  |  56 +++++------
 include/linux/netdevice.h | 104 ++++++++++++++++++-
 net/core/dev.c            | 207 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 328 insertions(+), 39 deletions(-)

-- 
2.34.1

