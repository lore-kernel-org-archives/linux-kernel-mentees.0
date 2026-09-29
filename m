Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166294FDA5C
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677080; cv=none; b=bAEKCycYeF2Kpgl8Gx1deLrU/FWscqdnzBS3qXVenUz7OmTH5VDw82kdqAiFPfqcbN0nuao+eZUdu04I8JII7bjmmtsXjp61Fmc9ulV0tDJFgeZqoAtp/y//tLFWmzC4tC0YTUtu4WwUFaaxE6AZKSk9VqpEoZjv1lS3I/XHzTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677080; c=relaxed/simple;
	bh=An6mkPZDYZWrG8lcKKYm9brAuxjDgA3tyL1/ir2SVvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fn2SERr1kKOopPuHK+gCTBH6tm6PpO2pdibYLHF8ZtmMP7iLx5qfvDIaUSMtwbGNRyt+saIG6WwvUI53V8d68txMQdVyp6cg4YMqf3PKc5BQgI8usZEJ2mJiSU5f3hd9O9P1wIxKyBMndPS4uylWZ9Xqzm4UlQbpNbatszF7FFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnfDFhyD; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnfDFhyD"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd046b87so2866841c88.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 03:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790677071; x=1791281871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBxqqrX6VFrTTZg5kn1+eJIOqRCLIYMSYIE031U9CBQ=;
        b=HnfDFhyDgqALzSjfUwTlatRpOlVYbL1Y23dpTSnMr2jw2f4sBSD1qOircza67JrYr1
         bni/PG25Sv+ffeZ4+/re1sTcLeUjYsDWufBioRIg/8HPhoCKIRReuPhBCFzc9IaJwRaG
         bSbIZMKQXGsbCIsBWCWW+8TuYSrYe1y36qFnSmLQNl6duCJAQCPEaeEorTCeiZRyeiTs
         rFqoopbeHiAYVT4uMZWq/1h9eYHiFEhqnntRVaD8/nf2hbjPRkL3Vsn60fSLNL41reeo
         4dhiWyFwZ4ws7e9WfRsEye1/bbeUwplB/FkyuHDejcRAj7mXa8Az2znb03mfWfN8YQoE
         qJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677071; x=1791281871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBxqqrX6VFrTTZg5kn1+eJIOqRCLIYMSYIE031U9CBQ=;
        b=UQVvhnaJSowTdOH+kB/aWYup3xEnTYAgOj9E7bZTBTvBTP3abYDAjHA5iRkMF31Roj
         xbBtjgjPOdG1+wwmwlZeqtkUj8gtI7w9yUMzYwSBEGYxsYnKZN6oCyns6jPnNPN5PAGw
         PVOL2JAT1oZaejRDnAhhyIee1s+qT7scXCZVFSnu8/s48sbpZTNGKC3QFSP7M54g8bHu
         4QjIqE2dLHTMPpqCCgJFNlY3Q/oF4y8JDekLem3uNbvskPiL2EC8hWJ4cCu8M8+R3p9R
         jO3JVxu4aMJl/8pGUEVhfi6pWMLQFQTghHkUHB8mUG9PXgkz6JH2jgVtFOYFc2usF4X0
         S9iA==
X-Forwarded-Encrypted: i=1; AKwUvBwlTJfAdFVeNxWAiayuKO4p4DP7nz724iiE35OPzbMGCv0psa96RpG1F+OW07JWOV0kkUotrwv+xg89AGYy0BzNgMDHXA==@lists.linux.dev
X-Gm-Message-State: AFuF++m+/VR5vELabZEFZCW940tFl8jxMeEJgpwh8YnfTy71bIFp/8LZ
	nMT6uJjGSzffcfgwBOgwJ3WycPl7tHXevqX73m7+hlWV9BhA8Jquv2X5
X-Gm-Gg: AYBFou39h4P9P45RLXMWOImKdL4Zz9ByoVgog/3CXtOQWU71bmH7Ud5V9hk47Qo+u31
	zNHpNLIAECtP7ZAVgZDgZ3Jvp4lAgpOQZyYEyHaZRFmEm0UvxfnJ4OKX+/Sc1VGu9Du2wNxliYn
	8AbAx/iWNrk9dBjrr/rRTqrQ8/S7PDrV2rNX2s8do6JIfQMfsYdtYN4tsuzbE3h3/9LPotydf9d
	sUGYWY/lsS7ZdJVjvAzlBq2YvYtAQ0RTX9lJk0uOfkpxX1TEBEVWHgTZ3UKpAWAGTpP3muHVcSh
	VAV1gVyDrtfB0Kv5Wmv266+BpNYKyOC748OH0YiekI5Jw+jWoGffMZD7+HBrXHbWLvqncjjb1Rz
	74278RbAsDaeEpvTlMFtkl+NrEv6HA6jv2b79Q33TfNdLM9Fh0B6B5MGruWJPJhaHsoTgx4xUnH
	jlmqND+8kmezcxYZguWsqzKeIrc3NjF6bcHaZBRS8+ze0/VJM1CRas2z2yQA==
X-Received: by 2002:a05:701b:4344:b0:144:fc5b:2121 with SMTP id a92af1059eb24-146ce67fa31mr13579743c88.17.1790677071222;
        Tue, 29 Sep 2026 03:17:51 -0700 (PDT)
Received: from evangelion-g ([2a09:bac5:40e4:11cd::1c6:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad9e097fsm34324648c88.13.2026.09.29.03.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:17:50 -0700 (PDT)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH net-next] atlx: fix kernel-doc description for atlx_tx_timeout
Date: Tue, 29 Sep 2026 15:47:13 +0530
Message-ID: <20260929101714.51579-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing @txqueue parameter description to atlx_tx_timeout

to eliminate kernel-doc warning.

Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
 drivers/net/ethernet/atheros/atlx/atlx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/atheros/atlx/atlx.c b/drivers/net/ethernet/atheros/atlx/atlx.c
index e8cfbf4ff1b5..0a6205e5c19d 100644
--- a/drivers/net/ethernet/atheros/atlx/atlx.c
+++ b/drivers/net/ethernet/atheros/atlx/atlx.c
@@ -182,6 +182,7 @@ static void atlx_clear_phy_int(struct atlx_adapter *adapter)
 /**
  * atlx_tx_timeout - Respond to a Tx Hang
  * @netdev: network interface device structure
+ * @txqueue: transmit queue index
  */
 static void atlx_tx_timeout(struct net_device *netdev, unsigned int txqueue)
 {
-- 
2.53.0

