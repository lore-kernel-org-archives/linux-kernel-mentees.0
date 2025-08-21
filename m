Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788BA2E5423
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755794920; cv=none; b=CO6s2E/K4tFzIhJj4aiFomqxZaWqt2gItivEInId5/sp0H6jj7a0DqQtMwY8LfghWihU7FtjSR2Eh8X8RPTCFX3ha/WYpHC/kx9iQ1GJzw/kN0j1i5/3zlhE9zHtGmR6ORd/IAwm3o6wYW5wE70X0eA2JxvbWvCdMhjxO/s/QpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755794920; c=relaxed/simple;
	bh=4rGWUgQSHCHbuCa0KQOHSQHWufusj7woJ2A9o0WLvdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UB2qdT1tdH9+zHFKQ/TdplUI+wEwlP0WvkWs+r3u325EzHpvyXltJC3LJ1L8Olx8hSgSqgX/quOx92uIBiafPRpn1QhkmA7ry4KW95j0aCOg1U1QZLBeOvSN8vUS0BoFw5lmagsLn206SNxraV4w/sIkFwVgwgoGXIQOcI8Q5vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debanilchowdhury.com; spf=pass smtp.mailfrom=debanilchowdhury.com; dkim=pass (2048-bit key) header.d=debanilchowdhury.com header.i=@debanilchowdhury.com header.b=Y9f41xJY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dDGcSQBm; arc=none smtp.client-ip=202.12.124.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debanilchowdhury.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debanilchowdhury.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debanilchowdhury.com header.i=@debanilchowdhury.com header.b="Y9f41xJY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dDGcSQBm"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 29376130062F;
	Thu, 21 Aug 2025 12:48:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 21 Aug 2025 12:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	debanilchowdhury.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm1; t=
	1755794916; x=1755798516; bh=LcP0PiXvmPRUn1aPfZHAcVFXMOdFddlFyCh
	yIjJbPq0=; b=Y9f41xJYDM/zheYbgqpMzaOZuiED8xgqN8izrI5kWPblztPSX8f
	7+azV55nAOmpw1F/ewKRqwq4pOkOM3ZYpUjE9JoOPxuXzvKR5x3XX8Lw5iJ/HI4E
	GNs+cXJCV3MnzH0Ol72ealBAH+a1mrhACp53BrncXdJiziZYg1LTIJzy5pmCaDDJ
	RwuxiHBQkXa0Mg5mGKxHkDcgBeCqjqienmJifCutUE8hW7Oh0Z+rIb44XttDKa+Q
	QG+SHI9uN7IVOH0/pK0gmWSp37BBQglJoMTqm904djAUT51MW4tOkJE5ixiGMZJ2
	sloO3Sa4E63qNo0cJwrK+x5urmOhaTPrZpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755794916; x=1755798516; bh=LcP0PiXvmPRUn1aPfZHAcVFXMOdFddlFyCh
	yIjJbPq0=; b=dDGcSQBmHDiPtr31pUU8G1wm7ZvxZHByAFY7EY/m2aG3T8XnCxO
	GxqZVkkbbLJUqubKNLjIQwhKy3+jU4sCK2yCeD4o31HipypqGD/WalnZuBcXroMJ
	g3A64L/N37Ci1SJv18nkhTOpL4sWE0awJyb2mpquAVvO35ezonILn2cONyMzIDYb
	8HjDHMBbiVMGl3WSAbmAnAJj1saY8Yjuv4scPvJD3wbUHht9MYpb6L90Uq+/GNVw
	gbG5LyhokKXupnyVYHfaACT+Iuj3zuAtb7JjpuiInuIxe6QYGtgHgiNxIoZkopuB
	nFx113yBxlXbsaqk9nixk9ro/XD0DOT9yIQ==
X-ME-Sender: <xms:402naKpalz4qp0kEPPxZOz_NyHtI9mGg_zF0u9pNTqinXN73MuRymw>
    <xme:402naL5eHNc4Ddqd9vAjK0kVrBbZYN-VpIwSRRJ9j30EWH0nluEpaEHWIH0gwinVF
    NmQAXkQegO-fO8J5bs>
X-ME-Received: <xmr:402naIqOJRhF9XioXMj_G-w2Fs5YpTWaABy_Z35ylIX7jnFEXx0BxuIISyetY5TILgPmBygK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedujeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeffvggsrghnihhlucevhhhofiguhhhurhihuceokhgvrhhnvghluggv
    vhesuggvsggrnhhilhgthhhofiguhhhurhihrdgtohhmqeenucggtffrrghtthgvrhhnpe
    egiefggfdthfegieffgfegheegiedvudffieejhffhiefhfffgtdehkeeguefgtdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkvghrnhgvlh
    guvghvseguvggsrghnihhltghhohifughhuhhrhidrtghomhdpnhgspghrtghpthhtohep
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhkhhgrnheslhhinhhugihfoh
    hunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgv
    nhhtvggvsheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehkvghrnhgvlh
    guvghvseguvggsrghnihhltghhohifughhuhhrhidrtghomh
X-ME-Proxy: <xmx:402naFgop4MPxyp_67Nv6GsMkHSGcfbPWcJH-JrR0iE0jG3Y0AzCxw>
    <xmx:402naKK-HMj_LTsjDCIhJkcqihNALNSRCpk6qH-UgLJFWHDUy54bkA>
    <xmx:402naNDAra5XwanPVR6te32NNv6ZxD1RSeyIFEAddO5D357Du9LlEA>
    <xmx:402naCi5JP4x56Hsfhr19-xaqO3QEGb2JJAMk-xI3sUrOpdZyQ2z3A>
    <xmx:402naGo9l1zHUV-LjsdKFd_DeWnMxnBe30ndlig-lCpH8W9nW-yK0Mqs>
Feedback-ID: i77364836:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 12:48:33 -0400 (EDT)
From: Debanil Chowdhury <kerneldev@debanilchowdhury.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Debanil Chowdhury <kerneldev@debanilchowdhury.com>
Subject: [PATCH] kselftests: netfilter: fix spelling mistakes in nft_nat.sh
Date: Thu, 21 Aug 2025 22:17:59 +0530
Message-ID: <20250821164819.2103-1-kerneldev@debanilchowdhury.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Debanil Chowdhury <kerneldev@debanilchowdhury.com>
---
 tools/testing/selftests/net/netfilter/nft_nat.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/netfilter/nft_nat.sh b/tools/testing/selftests/net/netfilter/nft_nat.sh
index a954754b9..05a34c135 100755
--- a/tools/testing/selftests/net/netfilter/nft_nat.sh
+++ b/tools/testing/selftests/net/netfilter/nft_nat.sh
@@ -569,7 +569,7 @@ test_redirect6()
 	ip netns exec "$ns0" sysctl net.ipv6.conf.all.forwarding=1 > /dev/null
 
 	if ! ip netns exec "$ns2" ping -q -c 1 dead:1::99 > /dev/null;then
-		echo "ERROR: cannnot ping $ns1 from $ns2 via ipv6"
+		echo "ERROR: cannot ping $ns1 from $ns2 via ipv6"
 		lret=1
 	fi
 
-- 
2.49.1

