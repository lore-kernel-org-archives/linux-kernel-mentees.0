Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262A32DE70D
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 16:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755794968; cv=none; b=KoFvXzHFTbmyjGGk9+IJx9kzEE5u1FNYJ+TG0t3v7o4xsl7S/8J261HeFtCGFQKiaZZeFysJYbsFzgwO4EvPFWoVcj/GINiSmLom1HGtx/hfNkmdOhpO2ElXgq0IABq02QIS8r0LNXUtCK5xxQZsVOMC/PBe34w9dAqlHNcC5Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755794968; c=relaxed/simple;
	bh=SUBtlO7n3yX9PXY8skj7IpDWg/e4whpbMu56ocujhBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oN8pt0XVi8BOjedX9ymUaxygEZd/v2Flt6hnd1m59HgivKDjB9BrSsruXpo/A39TuJ2kvYu9PcGwN7Heiw17clRViReR83HNhdOkg+/nrZXpM3gWP6LJUhTnzfCNamj/k2ZZa7l0Qy9ZcfC/w6Gbc0FEiR4u8ED8AhEgYRfI8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debanilchowdhury.com; spf=pass smtp.mailfrom=debanilchowdhury.com; dkim=pass (2048-bit key) header.d=debanilchowdhury.com header.i=@debanilchowdhury.com header.b=Qa1IOtiw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gw+kpeiZ; arc=none smtp.client-ip=202.12.124.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debanilchowdhury.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debanilchowdhury.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debanilchowdhury.com header.i=@debanilchowdhury.com header.b="Qa1IOtiw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gw+kpeiZ"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.stl.internal (Postfix) with ESMTP id D254E1300684;
	Thu, 21 Aug 2025 12:49:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 21 Aug 2025 12:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	debanilchowdhury.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm1; t=
	1755794964; x=1755798564; bh=/Z9ONaOgJ9gEK/00m/HqizUkeF2brk3xsyN
	jY+PwT1E=; b=Qa1IOtiwqOcU75UxdqXBHr+KonEQJCA8wIikyVNkdC7EZCrIHyC
	JaD0Nd53SpixSwp3ceb213Xu79YJVhFKmzLb8qXtnA+6QFMrhJRrd6GFgtToAMS8
	P2MD1A60CWhwvbekksqeFrlWBhFMLElVC0AbsBI9B2T/5Nf2dKJbum1qP30nK4KE
	p61p1amnva8yAb1UVO5v8OBNSlSoucNdVDLS4CI6C1bi1Nls5Wy71tA6sF1gp85n
	ALkxlU6BGFcrQB6uM7CXrrkg/pyfYP8ioDJFd9XiihGs4aWY0I8KilbOxyZ7upij
	Lwt4Z/7yBcIn1elTGHKdsJGUva+Cz/mMaKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755794964; x=1755798564; bh=/Z9ONaOgJ9gEK/00m/HqizUkeF2brk3xsyN
	jY+PwT1E=; b=gw+kpeiZIUYaR/iwKMClmqMypVB5v/ctK2gk3tIll/VauyXXch6
	g47wCZA8CpZfQf3+/zhmPbzRnyclF9/B3xtZEkZ7i7CWHOuWrKdVW27BJ5yEIqnJ
	q/W5XtNMGMI3uDxSHLp6tnHmkAyBJ7C2NmuKgp3VIUKGazlUMwrPPZNmM6wZzOxb
	IdXjROhA0e+wMg2Herz+fJid8e9XbGcve1hLj5R2SY7+ktrC2qR8yJZuPYzwzXIW
	C9O9dzJN9T55bFpBzOccEx0oPamm7z+XpOCZUtZ8lwVB3fHWyUmXIOVHF6HMGXA1
	89570FruIaOZo7tNh8/jOEEsxXbXJqf+DdA==
X-ME-Sender: <xms:FE6naD4Z1RXuTpjaw7uaOMwMDB8RWBZXHBlmNr8opPESopzEC2ehnA>
    <xme:FE6naMJ7D_6b3HkvZNhgB8FBXHwOO2Rj9Rt2cQ-xmZuJYll29Wa4c_ulZKY54jHRU
    ohsV8lN3B22V3G_mDE>
X-ME-Received: <xmr:FE6naD6BalE62c2YFCWh8tJxQfMA6eD6b5BoYT7En3EYNY0jhRsvqFVIxq1ULUXITPyz0zWO>
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
X-ME-Proxy: <xmx:FE6naPw2AK4AMR1RbqFGOefjo5nLfGcNHr6B8g2oib5yzoY6povQWA>
    <xmx:FE6naHZSX4plswC_jaJ0h8U1Mv9zi4K9dpBm9fwMI6zPWIwMQ5MZGw>
    <xmx:FE6naBQqR1U0e7HKuf-T2CI8HwN8l2aRZdxaB19PCZzuD55sqZxqmA>
    <xmx:FE6naByjucQPIgOShcZDXub4nyUEu1_7Th7H-CjFNVHLinaRLnBxEA>
    <xmx:FE6naP586f-6ACHrnTYSG20IPnWfYLjZVXDITtioz5gYXJs47AuZvTew>
Feedback-ID: i77364836:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 12:49:22 -0400 (EDT)
From: Debanil Chowdhury <kerneldev@debanilchowdhury.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Debanil Chowdhury <kerneldev@debanilchowdhury.com>
Subject: [PATCH] kselftests: ntb: fix spelling mistakes in ntb_test.sh
Date: Thu, 21 Aug 2025 22:18:57 +0530
Message-ID: <20250821164910.2167-1-kerneldev@debanilchowdhury.com>
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
 tools/testing/selftests/ntb/ntb_test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ntb/ntb_test.sh b/tools/testing/selftests/ntb/ntb_test.sh
index 020137b61..41ad97e34 100755
--- a/tools/testing/selftests/ntb/ntb_test.sh
+++ b/tools/testing/selftests/ntb/ntb_test.sh
@@ -39,7 +39,7 @@ function show_help()
 	echo "  -d              run dma tests for ntb_perf"
 	echo "  -p ORDER        total data order for ntb_perf"
 	echo "                  (default: $PERF_RUN_ORDER)"
-	echo "  -w MAX_MW_SIZE  maxmium memory window size for ntb_perf"
+	echo "  -w MAX_MW_SIZE  maximum memory window size for ntb_perf"
 	echo
 }
 
-- 
2.49.1

