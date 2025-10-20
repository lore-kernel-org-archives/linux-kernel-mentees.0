Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C892EC569
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Oct 2025 13:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760968163; cv=none; b=idPAShlxZ7YqxJyxu8JvStUTdT4HRqiLcMcTlg1kLtoP/qbR7RAt+V56upcKXy7/V/5JPQ5trnLnlY/PVU7H2kccLiDEdpRv82WwNhMbs62WQaZtuvF0yQNkS9HITL+VDpVw5c4oavqYcJOxD6i/WuKRstsmjDc2T9QHrRGNV8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760968163; c=relaxed/simple;
	bh=h3HoLkT4aFAk87mxUyKqKSEwXQ3salm8bUf/3v+FYOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HgMqx2UbfnDjKcXpZ8tP0K6A+6kEN9Gq3uzwSiJDeMi4RNTNKKfZFPb5JqlD7NxBqd+gE8IIvIpm79+CNZ7cdyxPf/A13a1Wfp+7C5up5Y3EUJQkse+4mtN31Zave8qoQuxm72n6Z5xijX9Jd14BEvJB/IcjVtjW9x7tUJwTSwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hA8Qjr5f; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA8Qjr5f"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33be037cf73so3069895a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Oct 2025 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760968161; x=1761572961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWKmwdA9I2ITUhToX2qR1cuSgLsOWMNN48NL48WMTnk=;
        b=hA8Qjr5fbe6BAIsXtfonLmR7toNHKLyGx7c436WG4En7K0V90mwXY8otyFBmEmuczy
         CzQTU9CmViIOscO3J6nsbokgPLUVJyks0S8cvts0Oa9eftPlJdgrY6vpJ3FHn4UNbM4V
         M04OTRaGterxgWEODEgBHJl7+1G9R5RJtNbWPIjH+tk+2CWDH1IYVL1XupOvdPNq2jRp
         x6qaDVterxATbJBq7BPjRUy3VccHDwvGB2t2+Mz6x4MdBVOnUd+HEEDhomBlUqWdpxHC
         idrCqqPLP+8QuuzDK2uvIbtDWlkrgMeB8OdYSKqSlMbLBBW4dpZ1vMcPtgBo8uSnJGU/
         fpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760968161; x=1761572961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWKmwdA9I2ITUhToX2qR1cuSgLsOWMNN48NL48WMTnk=;
        b=VYaQ75n4eNpkfPXALMo/O5tpw5zjBkLf+/vm4pG9HjY4xQuM10xDBnKEPn5+baH8x6
         JnrgFMClG+xgwmQVVARyRiQ1QpGy2miwkCu6FRSBUQRW2M0axllIImzv93tmycVN+j62
         uc1AF64WWg7WoXXVO2y2eARQQMvUwuOLSGrR5q63cyj1uSFpD8ZD1+0DqnGA7MCYn41M
         2ej0XYwkgR5enzty2FKp6dDWAXUtwC56yqR4izD7M2NiVtP62UTeF72yfIhVPar1NUEY
         LPhsfz7nRS4tMftOsQ1LZcrxlU9LYo/z7PpyRymkupZMg9xLKIZG7XEKGa+0fo38RVMx
         BHIw==
X-Forwarded-Encrypted: i=1; AJvYcCXjEF3u3Bq8KSz3QtqIovI+f5HS4BHRWkqDlDz+Y3DfEIB62eu7aUJKyf3JTOIlQVVgwcEExyt+i367f0899bUHyFlUBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwVIKKkIlZd26/DC0aQiRgsSOICRrS5HOEbFBSFs4JguXD1SO7
	1FZH6H2wtXGQKeyyEkSYVi6F4UCgzpWnJvwo3AMcsDgsNxl4F/oJuOGI
X-Gm-Gg: ASbGncsQYULpjhElOaZp0xl5rWzCSWOnya5arN72LW4UVSCYRbgJxmnvrYMHgUrvBxe
	zp6viGdlep2V8m2ZeET5JK6DxnLhLf6IXYauc9zrU9hS4zP2GRHLwLW0TF7i3bdyzNK905ZELKz
	uoIncBbfQHecwBRS17YB49jr/vLmpc/DoddkMCTWdDUcYkAcOdzpwojLgfG2CnfynquPtgdQJ8k
	bp44cO9BnV07GHuHIsaVwOR1exfP/12xl9Wty4HI94REVdhbkgbcNlpA68fe9IwzMRuKFio1dFj
	CrBm/InL9nU/ExpgtoHjseqdOnETV34YKfhCHH0oZ7ladti8q5IJovORCAAQ7mpU+XzwE2E+5Jh
	LHz7ur1Bn1ZWEs/u4v46kdek+wIhfBJYMuttJ8l176rbu+FkXJbuE7rQdMJ8k4Lxdi058mIpeMR
	zQM2xbOCjNELqxr3TCzaQ9RevrjeOkqsd0i+jm3g9Z6BBGeVXu35lyOqIkSdRfFExsxcTgdEm1L
	q41EFA4zWry
X-Google-Smtp-Source: AGHT+IESKh8p2QsR+Rk1v/wlAyJsWQauYznHQNj/lfmr1UJMevw6KGFtM4HMsy0OkeBrWdiwqrKe8w==
X-Received: by 2002:a17:90a:c2c3:b0:327:f216:4360 with SMTP id 98e67ed59e1d1-33bcf853706mr18348648a91.8.1760968161239;
        Mon, 20 Oct 2025 06:49:21 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1cc9:d444:c07a:121f:22da:3f7b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bdd02793dsm4507349a91.3.2025.10.20.06.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 06:49:20 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sdf@fomichev.me,
	kuniyu@google.com,
	ahmed.zaki@intel.com,
	aleksander.lobakin@intel.com,
	andrew+netdev@lunn.ch
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [RFC net-next PATCH 0/2] net: Split ndo_set_rx_mode into snapshot and deferred write
Date: Mon, 20 Oct 2025 19:18:55 +0530
Message-ID: <20251020134857.5820-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
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

To address this, this series proposes dividing existing set_rx_mode 
implementations into set_rx_mode and write_rx_config

The new set_rx_mode will be responsible for updating the rx_config
snapshot which will be used by ndo_write_rx_config to update the hardware

In brief, The callback implementations should look something like:

set_rx_mode():
    prepare_rx_config();
    update_snapshot();

write_rx_mode():
    read_snapshot();
    do_io();

write_rx_mode() is called from a work item making it sleepable 
during the do_io() section.

This model should work correctly if the following conditions hold:

1. write_rx_config should use the rx_config set by the most recent 
    call to set_rx_mode before its execution.

2. If a set_rx_mode call happens during execution of write_rx_config, 
    write_rx_config should be rescheduled.

3. All calls to modify rx_mode should pass through the set_rx_mode +
    schedule write_rx_config execution flow.

1 and 2 are guaranteed because of the properties of work queues

Drivers need to ensure 3

ndo_write_rx_config has been implemented for 8139cp driver as proof of 
concept

To use this model, a driver needs to implement the 
ndo_write_rx_config callback, have a member rx_config in 
the priv struct and replace all calls to set rx mode with 
schedule_and_set_rx_mode();

I Viswanath (2):
  net: Add ndo_write_rx_config and helper structs and functions:
  net: ethernet: Implement ndo_write_rx_config callback for the 8139cp
    driver

 drivers/net/ethernet/realtek/8139cp.c | 67 ++++++++++++++++++---------
 include/linux/netdevice.h             | 38 ++++++++++++++-
 net/core/dev.c                        | 48 +++++++++++++++++--
 3 files changed, 127 insertions(+), 26 deletions(-)
---
I tested the correctness of this by comparing rx_config request in set_rx_config and
written values in write_rx_config.

The prints I used:

After new_config is set in set_rx_mode:

printk("Requested Values: rx_config: %8x, mc_filter[0]: %8x, mc_filter[1]: %8x", new_config.rx_mode, new_config.mc_filter[0], new_config.mc_filter[1]);

After the writes in write_rx_config:

printk("RxConfig: %8x", cpr32(RxConfig));
printk("MC Filter[0]: %8x, MC Filter[1]: %8x", cpr32(MAR0 + 0), cpr32(MAR0 + 4));

Is this sufficient testing for a proof of concept?

I picked 8139cp because I could emulate it on QEMU and it was somewhat easy to refactor.

-- 
2.47.3

