Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC414F98
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Feb 2025 00:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739579890; cv=none; b=mU4HcpWPVVwAUiM1vOXi+KuAsLO8iXOfOVSV7+oWw198DOZllPga23aPhec7yurW1BixnNLjTGPcWSykeVEF8cURTQ1vs4nhbl83/B+dNMqLRV5nTtoLUNZ1/T5rMDhiydOCzLhzJK2F0OwEEPjN9ESEDh55iW9zRdF0P9Op7/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739579890; c=relaxed/simple;
	bh=NZP88OOVd8sOVeFyMWWdZu1T4Q5qG9mjnpmoDAwu/qQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dQDZtDPo42E+G4pLmimKeiQgt+BQSeiANXFaUYxmxkZpvIk/h/l5xyM9RcoGRUavdGfRuj9gPBaN+YY1RSvEIrzpYQggALJWiK1NTh9D0DPP7jxjbbePArpJNygRkVNqumiUb4QFIwotZZdohxH1fSlbA4NheO2PwirkLVMPbMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqbjbOma; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqbjbOma"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 696934128F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Feb 2025 00:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Evd28i8UHvBr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Feb 2025 00:38:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a35; helo=mail-vk1-xa35.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72ED841273
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72ED841273
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GqbjbOma
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 72ED841273
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Feb 2025 00:38:08 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-520602fc185so827292e0c.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Feb 2025 16:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739579887; x=1740184687; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uba/34vcev8nB2+9mx/dFBIX6O6ekMm5th//00Qxgbg=;
        b=GqbjbOmaN3B1F0JqUrrjk9CDVDA4cE8QehpySLNUaoGDxUh2Nj8FVuUG6yWAhKN3tT
         +ViLVikrEVFwSHprrLdSU4b1iE/EgUQ26TO8WpHoBT4u+KFSFVZ7rN5zu0JbNCIyVncx
         pSlh/UxUj+DKmeqO4BsoLSXQXCtVPB/uqaG4KvqUkp7nh+mIhi6GZN+QhRnWZjm3R3YO
         wj2quwNDE5EPYqMk+D9hMfvBLJmgWQoJOZLg/YTqBtGBFA61GZCmD1jTjL1jaQDvAMAY
         KtEoLzx6uY3t8thRWEX7ZwspKZTSwupSc8UHwIwbW9shLyb6eYLM7Z4W1scSDl1Ea3it
         i53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739579887; x=1740184687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uba/34vcev8nB2+9mx/dFBIX6O6ekMm5th//00Qxgbg=;
        b=LE6ufxbC6XlOmaU5dlvQGnI7p/eX0MCqtSBEGKxAahv1eSNh0vnnMRnIPErMVxJwwd
         FwIb29j+EObTrIlMVwkca+NN1IQXfzkLHc1Hc2otgZSjDJVOIql48V53+sB5pXf8zO+f
         4FD51bK0g7jJilZjgq4L7tpyDEvSBe6xoTcu48XKq8r4VwVNb9SW9nwMbXG+dk0fTumZ
         8AoQh4WryFlyx8+hgum1ejRlcev0dkK+NtX8x/jVUc+HoCymeHaEHB4ulpSJYnNxQBa/
         82HJpZ7zoGZ1tmJ0iawIb88HhmUG+3tltpvxIgM8Qfk5nFTxwjv6G7IyjHg/zkePk1o9
         uTLA==
X-Forwarded-Encrypted: i=1; AJvYcCWUCJoudwykD7WhqLBkacHQ3E1J4aZh5NZpY8o2viAH+/RbZpXYPsaxn9Rl6vV8GIdPIoFO1DH+nszEnL62TQmAzE8/gA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YygpvJ6g93tcXyHuV3PbuoNTSpFx7T8XPOhtsCvlC8ZZngXH1w9
	PmW3ue/FDnsWBIvELpzdwJMg75hxLE4yoMfaVavU6xr6XLFNDOWvuGUD5w==
X-Gm-Gg: ASbGncsmXs/Vl1yGWWa9lG797lisg4vatLAOxCcC5mDxR3BcYmocwjrCZLJthnONYDx
	fIzSh+Y7AtemN8yHrGcqxcXOTt/vw7aaX+z4hYzlH8uy4I2lI4D5s6uCukK1y4uG+y0S71vEIMv
	jBbfIkS/EpkTC7v8xIXvqz5ojVhnY8Qm9P4uonG4mgQi5rVc6YLVHIfExB1GdPF6uwKDtT5upXq
	ANPYcP/nNV0ndBcW7ZXngYkDsbAAD3GgkixF9MhXS9/D91YlV1gy52dh0fGYaofETBGyMLPoO2s
	Z9Rm
X-Google-Smtp-Source: AGHT+IG0Qsp3zBqrDJ9vcgiM1ZZJXWCtpPeDbJHrSNYpl5rhQFtE8hevU24TpxXeIZsYwVDuaNZozQ==
X-Received: by 2002:a05:6122:20a3:b0:516:230b:eec with SMTP id 71dfb90a1353d-5209db668f7mr827598e0c.5.1739579886818;
        Fri, 14 Feb 2025 16:38:06 -0800 (PST)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5207ab6f6edsm939621e0c.48.2025.02.14.16.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:38:06 -0800 (PST)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht,
	pablo@netfilter.org
Subject: [PATCH] selftests: netfilter: Fix typo in conntrack_icmp_related.sh comment
Date: Fri, 14 Feb 2025 21:37:25 -0300
Message-ID: <20250215003802.1466786-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the typo "adress" to "address" in a comment in conntrack_icmp_related.sh
to improve clarity.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh b/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
index c63d840ead61..f63b7f12b36a 100755
--- a/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
+++ b/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
@@ -171,7 +171,7 @@ table inet filter {
 }
 EOF
 
-# make sure NAT core rewrites adress of icmp error if nat is used according to
+# make sure NAT core rewrites address of icmp error if nat is used according to
 # conntrack nat information (icmp error will be directed at nsrouter1 address,
 # but it needs to be routed to nsclient1 address).
 ip netns exec "$nsrouter1" nft -f - <<EOF
-- 
2.48.1

