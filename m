Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA102D8372
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 12:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754915935; cv=none; b=IVlcB8svXsYamajkcb3kiyB4OeIf5dWDX9iSTquAk9yui6RaWfT8byKelhtkU4q6mJ7UgS+sAOlvpArjSYzXwV/S4GvBSRwBvRhR+7J+GIeZ0M4IjOaVcr7NNjelz9Ih6ZFMGbF0DAGGOZEm4sZ8AktGHPzfVa1Y6qAxhatew7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754915935; c=relaxed/simple;
	bh=yVT7zIEM8L0Ayto9GaQ35FMCs7tJuffENXDUPRt+cWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWbaR3IobjXv9R6wEOOOYrK2qniTJQa4O3gv12FDmpq2xjJMHyYMYbmXplOquY68z5CK+5HQIp8Chtr42JnZ1L3aL3KBWr/PuAU/+S6/vet6WZh9EmKT3UTI0mpUe9pWOEBg3O/LiMPtXf+cxCGemD6/fQwXWSMVTs+wyxSS7Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIgbpveI; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIgbpveI"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-321a2faf29dso799119a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754915934; x=1755520734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/o0z3DaV7VAvUAExqBKbFBwFPtOI2swPV6d6/RKxhM=;
        b=EIgbpveIIGsdut5CKI+zNngjxckrpmKnW1PFzWKCt9dYTwAUfKrnl0cG2S5x7rrpdf
         btzVemyvnEo+YTeq/nHdAhULKfEQNkgMxr07Bhiy1ABFzjdhjEWUHdg7iyTQF95byn7B
         bJp3r966ehQJjNSH14yiMPS3ZDP7clKJoNN4/aGir8sF/pvzxPE3EzOPLvnJhserCWs0
         DMLJOBG1QFnuBbg6sbWY5BlFzn61ho0ia/SeT6c0AbXvENI8pmxY3YtcWEyGQPl7S/3t
         kNMRgu1654ClOZMOOfzzekF9Fj2maWUPAdGVluT3pcxsa8GwYvWCShCRgyh7dq9gRohS
         Wfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754915934; x=1755520734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/o0z3DaV7VAvUAExqBKbFBwFPtOI2swPV6d6/RKxhM=;
        b=FAPWRX4otZlWWIQgrHfv0O8oHsKLVoY1lVYNGsEM5HwfBw8WjbrUBBy5hHVpL3/9R8
         lSOtGFDfLmiRr40iCpsVZ4pB2XU5uzf8265bFxsfuQ2kytvyl7lLShx4RrE5AokfPjDi
         6O90YfFyDtLeg02cNCW30zZIrtaE5AMAuPd4+f2dtSANszFizf7Vkevb/D0tIfvcifeB
         FG2uoPxyCDFCsrjvIbE0m3OG4i0EKfHZFKUduj8Cxo0HbqUwFKzqE+xbAOdmNt5EGicO
         9FLVuUOHUnSOrqJQqt291XhWuVFj8uIQCm1XD3rfpVRxOFwgm7dj1u/LjW4yJLyMyT82
         SniQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHmfbUIhcoYt6cp+soKnT367TB0fKePAM2fXzwuuVyItn2YgOCo+hNcSl6JHwNhHH4LMb+H0hrMMhtRkW3VHlF/dfyVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDDZhtQF/kA9j/S1hCbph1wJh0RbCao92h10+qJjYhYThD39+1
	zIVzpcXGZmHFpF8dd/HScBnh6M2xBlDR27B+OK0YEnLSFBsxJOUDNvs=
X-Gm-Gg: ASbGncs63u/Oz4nQEwhNi1DiYJU8+Ikyl7ubKBmPPWXvNKdYvjPXAYFomdv8EToEHYj
	7ueypszaKawOSRAzb/mId2WgpuLc+ZxL97h9OIFgvM1Ukn6ev/yIMLGoOyEiQTYHt+biE+Y4sAY
	2hyvEnkXvYtPZCXUFKdLPP54CgPlkGJOkfy3N3TUjKXc0K+RnSadgdZZOmr87XY1JJ8TM+FdQhD
	rwlw4jXDBHki7LoXD92S2or3xCAL26jSicjcQfACehRQQs1BgAQKqfqg+dCQz2FqE4uW9VqJPiE
	YGTcYNC1/RCpCf0SscMQ5xYQs6bIPbQNXlnyI45UJBkdkMDyb4Fsrt9i6gTX7Vbz+V7otvxlaiy
	bSiXzwKGThyPVVHNvtv/azuP9AQuY5gBpnm5cWfiW
X-Google-Smtp-Source: AGHT+IHf7OTgeX8W2U5Ar48gT005QTx5frqtP1Vp31xYrf3Gih3brf/ukJ5kgvVzbR5OhuRlYsgRAw==
X-Received: by 2002:a17:90b:4f4b:b0:312:f0d0:bb0 with SMTP id 98e67ed59e1d1-32183a04a25mr18566994a91.12.1754915933256;
        Mon, 11 Aug 2025 05:38:53 -0700 (PDT)
Received: from kerneldocs.. ([157.51.80.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216128ac08sm14731699a91.30.2025.08.11.05.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:38:52 -0700 (PDT)
From: Nikil Paul S <snikilpaul@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	snikilpaul@gmail.com
Subject: [PATCH v2 0/2] docs: fix dead OLS links in timers and RCU docs
Date: Mon, 11 Aug 2025 12:38:35 +0000
Message-ID: <20250811123837.4378-1-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates outdated Ottawa Linux Symposium (OLS) links in the
kernel documentation. The old URLs are no longer accessible, so they are
replaced with working references to the preserved content.

Changes since v1:
 - Added missing Signed-off-by lines to both patches
 - Updated commit message prefixes to follow subsystem conventions

Nikil Paul S (2):
  docs: timers: Update dead OLS link in timekeeping docs
  docs: rcu: Update dead OLS link in RTFP.txt

 Documentation/RCU/RTFP.txt       | 2 +-
 Documentation/timers/highres.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

