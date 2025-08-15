Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B0F3398B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755217126; cv=none; b=Vft3vvZNi8wEpn5nC78dIQPjbcSWz2PIQ+Tfpag7wZAijxRmwy5aymjPzLsU//8gcr96JqcIx4msspKzyUjL6HPhpLNT9TzK4mzAVoeKdv0XY5vymLfbJH5HdQ21SGYCN+eMzG1PqSc4cUbqucKKyEgobiFfUB0p9vD3fwkDkWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755217126; c=relaxed/simple;
	bh=YSHQ0nHVRPFsB93Dabwiu8ozEATJ/8Mr0PnXcpCB98s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uvkhhDFAQda5cdgEGqIp8WaFNkgFhLATKhSFTQ86XwTd56a7vRJIo5/oAkjsPvgwwmXtdoQDrsDHalqTKQ733TewL8JzgVwDzahCiPivB0YX74qiDSHfmwSGml3Y40XwFTxvJjTAU3oWJd4knCZlV74jgYN8jIDopH2ocHRm0K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TO/sEhos; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TO/sEhos"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1038880FDD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zh69bFBD_zot for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Aug 2025 00:18:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8481280FD7
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8481280FD7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TO/sEhos
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8481280FD7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:18:44 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2445806c2ddso12760165ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 17:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755217124; x=1755821924; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHJYqmfxyB1ZtjnaSlG3/Xthq2PX+hi9aHfPk8z27kw=;
        b=TO/sEhos001tVoul2tCkspTN+xjKv5Y2sDuuIhzlnPwDr3FoXRv4aZxvYtPQLsbgR4
         RUEigKr5qQBdikih5lS2gDyS3OJqcXVB5N/OfOvB3mYNpGZyPDaAb16LJHCOmHkfLYpL
         bkxKP3Y/tOlodp1WYJivXNIjD1MpRXcfmQJxOJVYmAqVy0+qqWpatYDZnuTUx0gO6eN5
         fMgnvJyuX1bumZ2jSYkDcptjdrsHavUgAdh0e50eoCm9LJkBtKD356ExPjB0YXBOU+vp
         OP0RcVOM+7ISvFgPmYNLf7ahp/YNfFkNnwew9XYKRCASIk1yHOgRuNYY6PfIHV2ybKvD
         oNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217124; x=1755821924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHJYqmfxyB1ZtjnaSlG3/Xthq2PX+hi9aHfPk8z27kw=;
        b=LzMp9ZnCPu1BLnSX3j6Yn8ABo4IfGGc1kJ6ryke5v+GqUHEcvuksO9F7JAR9yop8cO
         8kCRRa7X3Jw4/uKN7BEJBohBXlbcjdeali14U9muuCvBYfsegtdRE16mKGST6kfTVoWh
         p2o1RbyP0VCmwucDW/PWAZJSe+8j7xWZliNJBWZcQXZow+lrgTuXj2t43t09YCmMW7F6
         HXq83lZziKn6QS652lElybSg8VwKVSrbqzt8vpY2QDbdQhxLx7KZNXmKw6S6DzoJpZEz
         iYjjnDmi9NEsyKRctSx8lK1KvC4ypks5EBc/g+eEC+NuxpMlTxr+iYJR2Q7HpOJA9tbq
         wV+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlvYcrE+YLQvP+EQncTaI2Xan947JIseUsohg3aVWvw0vfIn5e7b2RHjcSGtlYQwv5YQn/DDW1eFVLBSRVpcSYYgPCrg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyLiXugoQB+ctR6A7ISBFDvU4+cWym3VAIvk/n0LwukLVHW1AVj
	GzrQHtshaLMEzkK5Rvh/AaBgho3QLtXAmuPc6I67aW0iBi5+6U2ZRAuB
X-Gm-Gg: ASbGncvJ+1EU5/x/GiahJEVeZ46xUR9uV7Y5iC30CjxePUPUKw34II8Lw9Va55umnyG
	zhEaWMXEp/ip5KViS5WMh1wupuV2r5UQbVZWUHedeBmLpeSkVAec4mBRYKl/Yib12qvcaCgtwMj
	vTsTVz9z0OYDpE8oj1AK4/fz6MMASB19m/kspPbo7pIsIXuHTDbp9BIq2Oiy0TFaMRHOqfx7Qon
	2QN3Z02mNZq1qAoP3oykbdu9hVgCeS0+N5F3ySKvG13KcRB5mf8frbAiHwbXSOIeZOpLcO70LeX
	+oN4wcIVx5znSRRZ2S6HEGMj3Qaz5sX6WYXVHZPeG+d1C716RkPRL/CR0awZ6LD/FcOnBeJjKva
	16Q8F7n/vBPFydM9HmiXm1QzeKhcv2qsJx0lJ9DOIVQ==
X-Google-Smtp-Source: AGHT+IFxzhdphiJBS2G/UPMPzKz6foyjIJZMPLW6JxLo23pShrslemm4KTOWFETkoXre0puhmLRAcQ==
X-Received: by 2002:a17:902:c947:b0:240:aa0:1584 with SMTP id d9443c01a7336-2446d8db8f0mr2125065ad.38.1755217123642;
        Thu, 14 Aug 2025 17:18:43 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5a451esm700745ad.165.2025.08.14.17.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 17:18:43 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org
Subject: [PATCH 2/6] setftests: net: netfilter: fix spelling mistakes in output
Date: Fri, 15 Aug 2025 05:47:59 +0530
Message-Id: <20250815001803.112924-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815000859.112169-1-sohammetha01@gmail.com>
References: <20250815000859.112169-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed following typos

- add add -> add
- cannnot -> cannot
- fowarded -> forwarded

in `tools/testing/selftests/net/netfilter/nft_nat.sh`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 .../testing/selftests/net/netfilter/nft_nat.sh | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/netfilter/nft_nat.sh b/tools/testing/selftests/net/netfilter/nft_nat.sh
index a954754b99b3..44a8fdf5c19c 100755
--- a/tools/testing/selftests/net/netfilter/nft_nat.sh
+++ b/tools/testing/selftests/net/netfilter/nft_nat.sh
@@ -164,7 +164,7 @@ table $family nat {
 }
 EOF
 	if [ $? -ne 0 ]; then
-		echo "SKIP: Could not add add $family dnat hook"
+		echo "SKIP: Could not add $family dnat hook"
 		return $ksft_skip
 	fi
 
@@ -239,7 +239,7 @@ EOF
 			test_inet_nat=false
 			return $ksft_skip
 		fi
-		echo "SKIP: Could not add add $family dnat hook"
+		echo "SKIP: Could not add $family dnat hook"
 		return $ksft_skip
 	fi
 
@@ -418,7 +418,7 @@ table $family nat {
 }
 EOF
 	if [ $? -ne 0 ]; then
-		echo "SKIP: Could not add add $family masquerade hook"
+		echo "SKIP: Could not add $family masquerade hook"
 		return $ksft_skip
 	fi
 
@@ -509,7 +509,7 @@ table $family nat {
 }
 EOF
 	if [ $? -ne 0 ]; then
-		echo "SKIP: Could not add add $family masquerade hook"
+		echo "SKIP: Could not add $family masquerade hook"
 		return $ksft_skip
 	fi
 
@@ -569,7 +569,7 @@ test_redirect6()
 	ip netns exec "$ns0" sysctl net.ipv6.conf.all.forwarding=1 > /dev/null
 
 	if ! ip netns exec "$ns2" ping -q -c 1 dead:1::99 > /dev/null;then
-		echo "ERROR: cannnot ping $ns1 from $ns2 via ipv6"
+		echo "ERROR: cannot ping $ns1 from $ns2 via ipv6"
 		lret=1
 	fi
 
@@ -598,7 +598,7 @@ table $family nat {
 }
 EOF
 	if [ $? -ne 0 ]; then
-		echo "SKIP: Could not add add $family redirect hook"
+		echo "SKIP: Could not add $family redirect hook"
 		return $ksft_skip
 	fi
 
@@ -673,7 +673,7 @@ table $family nat {
 }
 EOF
 	if [ $? -ne 0 ]; then
-		echo "SKIP: Could not add add $family redirect hook"
+		echo "SKIP: Could not add $family redirect hook"
 		return $ksft_skip
 	fi
 
@@ -844,7 +844,7 @@ table $family nat {
 }
 EOF
 	if [ $? -ne 0 ]; then
-		echo "SKIP: Could not add add $family masquerade hook"
+		echo "SKIP: Could not add $family masquerade hook"
 		return $ksft_skip
 	fi
 
@@ -859,7 +859,7 @@ EOF
 	# from router:service bypass connection tracking.
 	test_port_shadow_notrack "$family"
 
-	# test nat based mitigation: fowarded packets coming from service port
+	# test nat based mitigation: forwarded packets coming from service port
 	# are masqueraded with random highport.
 	test_port_shadow_pat "$family"
 
-- 
2.34.1

