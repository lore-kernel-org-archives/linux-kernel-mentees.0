Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD8C172763
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794849; cv=none; b=oUYoEHSvrkvChq3i/OhdB6nqejlPqqoa74AR9Ozmmd2ldxOfijsYhU+2xLG20wYaww6lS4YJaEu/SCnaYooQip/tCfPXYwaVe0X3Jfh1Jlut/pN57pY+XjlJtbe8YfVIUyaX+7hp0L6cIF1e/q6q8fjX2E8HLAQm6m4eIQt4dEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794849; c=relaxed/simple;
	bh=A8JyB70BTgHceWvqnOatyR97YW19SBU/k6G+VoPrhuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=a6bem/D+dIKEImxYaEDG/G4JcTyD5Srkpraf4MNPxPQqAYImySoym/bTwcI0K/+M4sZVWe1m7VyuyoFv+inACDTN9hXJaw8NnQtpg7nvRZY2ecqQmAXY+EA0DUkI00q8bOl0o/aPMszqOtTHrVAekFaDfBLS8HA6a5tzEc+Tleo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E1hCnlgG; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E1hCnlgG"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48CD340BE7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 14:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nzal2D9w2bxG for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jul 2024 14:34:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4FD74031F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4FD74031F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E1hCnlgG
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E4FD74031F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720794845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0DLwaSRoDde6WZrgZ+yrZtXJoG5Gh87TSS23CjKmFiE=;
	b=E1hCnlgGNzB4/knfgnP95nRPxlm2P5HoDo3acDkSF2leaJzY6HfKXNOs4VnSAoX5H7PAun
	wjKpfUH3LMLnYFnaXVbNfua1V25edQQJZnHKiMUv7Y9UiSkqyxrBDRNNIvqClxG4S6Aa0P
	h8BzPxXxneT0bS4rswRevFeseX8Torc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-fd7HOkpPPKm4k4r7kJ5Hyw-1; Fri, 12 Jul 2024 10:34:02 -0400
X-MC-Unique: fd7HOkpPPKm4k4r7kJ5Hyw-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-448335bb53aso1880321cf.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 07:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720794842; x=1721399642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DLwaSRoDde6WZrgZ+yrZtXJoG5Gh87TSS23CjKmFiE=;
        b=DN/wUMjzEOo2XcvZYS6rsT6S6r33x6WJUr2UBwjlXdQJ8D3hGZTEoWqgGBcaFwPkHX
         OWfF8HkMXHNtXJCTZgdNX4gANlnakcFMHXezXBgEylhTWvtax9v02FtvASDv7muF6Hbu
         uQfjCL5IDBH6JTNjB0Xh9rTYKc1vFuvNurGd/g1xneoqEcEftp7613440wq9CnJn0Ag/
         Gbu7CSknENjBqMuG/q8m5//qftkQtTTszxuYr2JkaCIOL/T+n/AqIyobufBDp56PAFYX
         2xiWMhMy4hNR2LX3wgCcnSVOt5CD9ecMm7jVWsF4jB7PFSBjGbQ+UP+8nR3HkLJsN9Hj
         N6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU3zOQsO9ybP5L27f1u86tj//wt3M2fAwEr2RHqp4o6LHw5b9SgnmvJDCrdsDAqvYJh/kngXKMz8YKyRizCYWktwxwozzjrYJtz+K+Z8vgwHrX1Pg/vKGaDFhlXcKby
X-Gm-Message-State: AOJu0YwAGr5h6SnuNZ5zHYZjECjx+0oZfCLRlMmaY9wo/PMHX6TYHVes
	zXvGxp/ZlX1qHwVLfxzJDhxDsRGQ84RCGeS0E6aQQ6i7z7PYbPc3kqOdMFBew3tyFOACgFVA8Vb
	G5YLID/GaPg83dn2kpgP2KVlTj0DTvFAic9j6+2J6cdSHIAETbbgPZyWx8BtNZjst7ADw8EeEpt
	5+5KzpuZZI7g==
X-Received: by 2002:ac8:4a10:0:b0:44e:cff7:6261 with SMTP id d75a77b69052e-44ecff7639emr12121741cf.9.1720794841878;
        Fri, 12 Jul 2024 07:34:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEld3Uv1U8nPh3+YCPklOwBx/ZeFSFfiIed8XQn011EvrY+rsoTGjsfqfObI0oTFmuVGQkJUw==
X-Received: by 2002:ac8:4a10:0:b0:44e:cff7:6261 with SMTP id d75a77b69052e-44ecff7639emr12121541cf.9.1720794841546;
        Fri, 12 Jul 2024 07:34:01 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-447f9b2818esm41025581cf.10.2024.07.12.07.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:34:01 -0700 (PDT)
Date: Fri, 12 Jul 2024 10:33:58 -0400
From: Peter Xu <peterx@redhat.com>
To: David Wang <00107082@163.com>
Cc: akpm@linux-foundation.org, david@redhat.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	peili.dev@gmail.com, skhan@linuxfoundation.org,
	syzbot+35a4414f6e247f515443@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] mm: Fix mmap_assert_locked() in follow_pte()
Message-ID: <ZpE-1nBtaxuSAiqD@x1n>
References: <ZpBhCHsG39wIVnQN@x1n>
 <20240712131931.20207-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240712131931.20207-1-00107082@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jul 12, 2024 at 09:19:31PM +0800, David Wang wrote:
> Hi,
> 
> > Ah yes, I had one rfc patch for that, I temporarily put that aside as it
> > seemed nobody cared except myself.. it's here:
> > 
> > https://lore.kernel.org/all/20240523223745.395337-2-peterx@redhat.com
> > 
> > I didn't know it can already cause real trouble.  It looks like that patch
> > should fix this.
> > 
> > Thanks,
> > 
> > -- 
> > Peter Xu
> 
> Just add another user scenario concering this kernel warning.
> Ever since 6.10-rc1, when I suspend my system via `systemctl suspend`, nvidia gpu driver would trigger a warning:
> 
>              	 Call Trace:
>              	  <TASK>
>              	  ? __warn+0x7c/0x120
>              	  ? follow_pte+0x15b/0x170
>              	  ? report_bug+0x18d/0x1c0
>              	  ? handle_bug+0x3c/0x80
>              	  ? exc_invalid_op+0x13/0x60
>              	  ? asm_exc_invalid_op+0x16/0x20
>              	  ? follow_pte+0x15b/0x170
>              	  follow_phys+0x3a/0xf0
>              	  untrack_pfn+0x53/0x120
>              	  unmap_single_vma+0xa6/0xe0
>              	  zap_page_range_single+0xe4/0x190
>              	  ? _nv002569kms+0x17b/0x210 [nvidia_modeset]
>              	  ? srso_return_thunk+0x5/0x5f
>              	  ? kfree+0x257/0x290
>              	  unmap_mapping_range+0x10d/0x130
>              	  nv_revoke_gpu_mappings_locked+0x43/0x70 [nvidia]
>              	  nv_set_system_power_state+0x1c9/0x470 [nvidia]
>              	  nv_procfs_write_suspend+0xd3/0x140 [nvidia]
>              	  proc_reg_write+0x58/0xa0
>              	  ? srso_return_thunk+0x5/0x5f
>              	  vfs_write+0xf6/0x440
>              	  ? __count_memcg_events+0x73/0x110
>              	  ? srso_return_thunk+0x5/0x5f
>              	  ? count_memcg_events.constprop.0+0x1a/0x30
>              	  ? srso_return_thunk+0x5/0x5f
>              	  ? handle_mm_fault+0xa9/0x2d0
>              	  ? srso_return_thunk+0x5/0x5f
>              	  ? preempt_count_add+0x47/0xa0
>              	  ksys_write+0x63/0xe0
>              	  do_syscall_64+0x4b/0x110
>              	  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>              	 RIP: 0033:0x7f34a3914240
>              	 Code: 40 00 48 8b 15 c1 9b 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 80 3d a1 23 0e 00 00 74 17 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 83 ec 28 48 89
>              	 RSP: 002b:00007ffca2aa2688 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
>              	 RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 00007f34a3914240
>              	 RDX: 0000000000000008 RSI: 000055a02968ed80 RDI: 0000000000000001
>              	 RBP: 000055a02968ed80 R08: 00007f34a39eecd0 R09: 00007f34a39eecd0
>              	 R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000008
>              	 R13: 00007f34a39ef760 R14: 0000000000000008 R15: 00007f34a39ea9e0
>              	  </TASK>
>              	 ---[ end trace 0000000000000000 ]---
>              	 PM: suspend entry (deep)
> 
> Considering out-of-tree nature of nvidia gpu driver, and nobody reported this kernel warning before with in-trees,
>  I had almost convinced myself that nvidia driver may need "big" rework to live with those "PTE" changes.
> So glad to see this thread of discussion/issue/fix now, I have been patching my system manually ever since 6.10-rc1,
> hope things got fixed soon...

Yep this is a similar file truncation path.  I'll repost my previous rfc
patch separately soon.

Thanks,

-- 
Peter Xu

