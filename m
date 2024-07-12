Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E416F273
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 12:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720788260; cv=none; b=lklfOqCFzzb8qyIMfajtvK7KgyaJyKrDTEpbhofNgqNWCiC0tlb61kndwsXy10e119tcao2J3AtiNSzijTWtJjKZGwgawqtJlH2L1ztOgTouFwHXAvO/5JkNt9yFLIQqeDl6Odsj9z9uWktQ2H3/lM9MbasOjcVZXqu3Zhm/PhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720788260; c=relaxed/simple;
	bh=6ufvLZh6JA1HntVTiuUbcXQAn3diVx42qGV3EGVvscE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+C6ZdOIoVU9rshTXwqPFxyyUq1ywA2BeVdnJ0oDfa5eNoSyHepR8l5AxfFUYkVOzC9/rTFb7L4RIy1/HYjlKnNldwtVMDd5xmN6tdEtwLbc0RsgsziAnkxmayLiffuJvXnC1qaARbe+mTiqXEN0w9/g0Lotq71aY10SnOk6JS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=qbN6Sm+w; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="qbN6Sm+w"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDDC9412F9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 12:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.097
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6aOfSfFH_jZy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jul 2024 12:44:18 +0000 (UTC)
X-Greylist: delayed 1550 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 12 Jul 2024 12:44:16 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 916D8410E9
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 916D8410E9
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=spasswolf@web.de header.a=rsa-sha256 header.s=s29768273 header.b=qbN6Sm+w
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.11; helo=mout.web.de; envelope-from=spasswolf@web.de; receiver=<UNKNOWN> 
Received: from mout.web.de (mout.web.de [212.227.17.11])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 916D8410E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 12:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720788241; x=1721393041; i=spasswolf@web.de;
	bh=o1bGVqOFBjkQcYKjdJ9UbZexqkUKxlvj8kOA0HhkZuw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qbN6Sm+wGDGXmrhm3m2cr6WcH5HCyzHvb3YOz5Ez9kD4iDD6747ubTldJUBC5GAF
	 DfUSXzQhINInGrkwa4oIjwJvwnuCluocR5Ew2JOdC1IQUwXREecypRvQ229GS1LaK
	 M9FOhxI4l57bNKZev9YKgFI7eLXG7GNbakdUMIePIEPT9nWvz3zC+IVFGFuuVZYV8
	 ji65d/1kRRpnsjqta0Y11vC3GsMssLNuaBtxedQNxwXGLfAPiEPAQIO1nw3+CCVlF
	 lZdZUHrsm7VeiMLO7YlGIInmCCqxDRSoWaVTdUQM63RB5yzZWBDmgSPjOgwpNVfvX
	 /EGBQuri780/fuiz8A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MNOV6-1siITT2P8M-00N6UL; Fri, 12 Jul 2024 14:44:01 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Pei Li <peili.dev@gmail.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	syzbot+35a4414f6e247f515443@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	senozhatsky@chromium.org
Subject: Re: [PATCH] mm: Fix mmap_assert_locked() in follow_pte()
Date: Fri, 12 Jul 2024 14:43:57 +0200
Message-ID: <20240712124359.3199-1-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: 20240712121800.3049-1-spasswolf@web.de
References: 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QrKMnFDuH2I9+4nVwL03BNGAfmYfTc2RgqzO22r8ATYSy6lJLtr
 /0WOeyc6NgNxvxO7SoaRYkiolL6QIMXXibAu2RoQg/94Yii+EU8BeFuXe6JTwd5B3hPSWtC
 plztMw+RINRDzvUUtww3kykFalrpoPVuCQVo8gGNmQCZgeMV0J2ptIjpY2NkAQAlGXjp8mQ
 suKhrzTp8+id6M8DIUt+A==
UI-OutboundReport: notjunk:1;M01:P0:X9mWF1c9VR4=;6V7S6xu/wfZbMJ9yJpqO5GpEcyn
 4/gYb00mhpDcIkodseQ0JL8fOPSwJ9Yh7O8yTuGgzoj+EQCGcdGljEEQ4PG4nSOsHZWabsY6A
 n/wjxOQJyX0a4ugluabwJXDaHVEhxj1TWM/PdVIEfuP3cSlMFenxNtWKCDfx9hgZFKF7SoYgt
 R0rD0baGO5j6090cN3p0NBjkofdCT60gFO13ZKpa7wg3F79AUuFF5NN/HEs+n32dt5L1mYOxw
 tJYlzmRhvT2uNNWd75w9Bl99v3vTmCPQCRfzdPFhZiIOYr0gfedqStXr/p8bibXjmFzL9ebtQ
 1sYiZigGnj3oGL1/y+jgwIccqu3kgCfSxlM0dNH9ph69U4vO6O795GR2jBp3RY9fQ/jBhn+sg
 hKwvA2ZalXFW7O69ygdG3wZBPRxkfxOc5gE4d6I7U01KEkf+cJef2GxL+oGu7dBp80LLNX8Ny
 IO2eBhraPn6+MWTidoS6UWtqIU5WehuxTkeRExInmXYyiQB9U8OaBdRB/5iStMKJaw3bhXm4z
 SnIQAqo2l46YwI65cn2PTgHex9oX4uzMPp7l9VH4+BOWz5xz91whiZSoXOZQXov5uI4QgMozP
 NMRQdg1WCCSjNCxNojkoayyuhOZt/LEMnxCNHhp5QfuwNWQL3fLNg6Sjul06hX/tqTrEXXBoK
 q8uj0gbz5l+VxINsBS/YaD0c7n0X3hGdDXz6ciZd2rQX7SGXO6xR0elJt6r/5OKDB9LKt44HZ
 CagqBUkgIAtp64gHC/P82wujssLBzx5FOqO7sIPgSNydezgqE2D5IztbOglP2JvIOFAirHigq
 qlfdUqvgVjmiHDAhj67ckv0Q==

diff --git a/mm/memory.c b/mm/memory.c
index 282203363177..2f4b4322ec0e 100644
=2D-- a/mm/memory.c
+++ b/mm/memory.c
@@ -1817,6 +1817,7 @@ static void unmap_single_vma(struct mmu_gather *tlb,
 {
 	unsigned long start =3D max(vma->vm_start, start_addr);
 	unsigned long end;
+	bool mm_read_locked;

 	if (start >=3D vma->vm_end)
 		return;
@@ -1829,11 +1830,11 @@ static void unmap_single_vma(struct mmu_gather *tl=
b,

 	if (unlikely(vma->vm_flags & VM_PFNMAP)) {
 		if (!mm_wr_locked)
-			mmap_read_lock(vma->vm_mm);
+			mm_read_locked =3D !mmap_read_trylock(vma->vm_mm);

 		untrack_pfn(vma, 0, 0, mm_wr_locked);

-		if (!mm_wr_locked)
+		if (!mm_wr_locked && !mm_read_locked)
 			mmap_read_unlock(vma->vm_mm);
 	}


This seems to fix the issue without completely removing the locking.

Bert Karwatzki
