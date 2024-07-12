Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D68EAC7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720791400; cv=none; b=cuE/+2cEAsxSQcn2JI9oZs0I5A5RiXGiloLiBFVTM4DCf+9OqakCb/toxQBeRCVpOx/trsCHER0n+WZhol0sAbWiFdFnaUF5lOlEjR9wOduY8UL7csBuZGvWuediNfCi4nP8V1meSny7PvpwfIUUn9cr4um4Ovh9BHaHclPpE5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720791400; c=relaxed/simple;
	bh=b9Hiyb9V12OK0cWf/wcBNEcB+j8b6dfOtprF3E37KfU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oUeR9Vbbfy+axKuBuEGMS23lGgjPWqdAYAElkERmItA41aJIHzr0qACXhqu75atIb1mIDTsX5Ys4/EFtpf3IZ1h5jjrzimLY9ti3IQNH29OnqLF17XbkI6jWJ5QSNk7qVKyIlxWn5DhlK8Ksj+uIfFUrduTAwHBJcNbKDp4M8Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=neGe+Nnt; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="neGe+Nnt"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50F8B40275
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 13:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.85
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJmTwvP01Ciw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jul 2024 13:36:37 +0000 (UTC)
X-Greylist: delayed 948 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 12 Jul 2024 13:36:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43B3440273
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=163.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43B3440273
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=neGe+Nnt
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.254.50.219; helo=m15.mail.163.com; envelope-from=00107082@163.com; receiver=<UNKNOWN> 
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43B3440273
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=HxMoF
	pqBNOKvW9AuKefuACYfanWfnrRyWhtwQoiUxdE=; b=neGe+NntTW2M2mqZ0hBbU
	btskUR43l5vvfl1dejrIUsA6WPXIMeHjdNYb+11lRUu4+Q8UQ1faapn9gpS7IVmF
	JVxG1Kw7I0PTuTQIo2P3CJWn4YFmcFWRfZ2/FbLx8E67GDmZgAeDi//gT8OH32qs
	ZSLTLjpoFcXWL7KvwPqb6E=
Received: from localhost.localdomain (unknown [111.35.186.71])
	by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wDnr2xjLZFmMD3DCg--.271S4;
	Fri, 12 Jul 2024 21:19:35 +0800 (CST)
From: David Wang <00107082@163.com>
To: peterx@redhat.com
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	peili.dev@gmail.com,
	skhan@linuxfoundation.org,
	syzbot+35a4414f6e247f515443@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] mm: Fix mmap_assert_locked() in follow_pte()
Date: Fri, 12 Jul 2024 21:19:31 +0800
Message-Id: <20240712131931.20207-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZpBhCHsG39wIVnQN@x1n>
References: <ZpBhCHsG39wIVnQN@x1n>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnr2xjLZFmMD3DCg--.271S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr43Wr1fKryruF48uFykZrb_yoW5Xr47pF
	1Yqr4UCrWxGr1DJr4xta13tr10y3yjy3W8urs3Gr18Z3W5J3W3JF48Jr4jvr98Krs09rW7
	tFWDXa1UtrWUtaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRrsqAUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0g0aqmWXy9z-AAAAs1

Hi,

> Ah yes, I had one rfc patch for that, I temporarily put that aside as it
> seemed nobody cared except myself.. it's here:
> 
> https://lore.kernel.org/all/20240523223745.395337-2-peterx@redhat.com
> 
> I didn't know it can already cause real trouble.  It looks like that patch
> should fix this.
> 
> Thanks,
> 
> -- 
> Peter Xu

Just add another user scenario concering this kernel warning.
Ever since 6.10-rc1, when I suspend my system via `systemctl suspend`, nvidia gpu driver would trigger a warning:

             	 Call Trace:
             	  <TASK>
             	  ? __warn+0x7c/0x120
             	  ? follow_pte+0x15b/0x170
             	  ? report_bug+0x18d/0x1c0
             	  ? handle_bug+0x3c/0x80
             	  ? exc_invalid_op+0x13/0x60
             	  ? asm_exc_invalid_op+0x16/0x20
             	  ? follow_pte+0x15b/0x170
             	  follow_phys+0x3a/0xf0
             	  untrack_pfn+0x53/0x120
             	  unmap_single_vma+0xa6/0xe0
             	  zap_page_range_single+0xe4/0x190
             	  ? _nv002569kms+0x17b/0x210 [nvidia_modeset]
             	  ? srso_return_thunk+0x5/0x5f
             	  ? kfree+0x257/0x290
             	  unmap_mapping_range+0x10d/0x130
             	  nv_revoke_gpu_mappings_locked+0x43/0x70 [nvidia]
             	  nv_set_system_power_state+0x1c9/0x470 [nvidia]
             	  nv_procfs_write_suspend+0xd3/0x140 [nvidia]
             	  proc_reg_write+0x58/0xa0
             	  ? srso_return_thunk+0x5/0x5f
             	  vfs_write+0xf6/0x440
             	  ? __count_memcg_events+0x73/0x110
             	  ? srso_return_thunk+0x5/0x5f
             	  ? count_memcg_events.constprop.0+0x1a/0x30
             	  ? srso_return_thunk+0x5/0x5f
             	  ? handle_mm_fault+0xa9/0x2d0
             	  ? srso_return_thunk+0x5/0x5f
             	  ? preempt_count_add+0x47/0xa0
             	  ksys_write+0x63/0xe0
             	  do_syscall_64+0x4b/0x110
             	  entry_SYSCALL_64_after_hwframe+0x76/0x7e
             	 RIP: 0033:0x7f34a3914240
             	 Code: 40 00 48 8b 15 c1 9b 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 80 3d a1 23 0e 00 00 74 17 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 83 ec 28 48 89
             	 RSP: 002b:00007ffca2aa2688 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
             	 RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 00007f34a3914240
             	 RDX: 0000000000000008 RSI: 000055a02968ed80 RDI: 0000000000000001
             	 RBP: 000055a02968ed80 R08: 00007f34a39eecd0 R09: 00007f34a39eecd0
             	 R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000008
             	 R13: 00007f34a39ef760 R14: 0000000000000008 R15: 00007f34a39ea9e0
             	  </TASK>
             	 ---[ end trace 0000000000000000 ]---
             	 PM: suspend entry (deep)

Considering out-of-tree nature of nvidia gpu driver, and nobody reported this kernel warning before with in-trees,
 I had almost convinced myself that nvidia driver may need "big" rework to live with those "PTE" changes.
So glad to see this thread of discussion/issue/fix now, I have been patching my system manually ever since 6.10-rc1,
hope things got fixed soon...


FYI
David

