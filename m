Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E4C27442
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755217241; cv=none; b=PzANS63brQreP7+3+xGwqhZvQJRUHewGw/hoD4KvVK3wcTWcHDlnCw28/VOiPjcgb+Hij/OeZA93bPGMd9Oo189XVnCMxvSRJMvfcadFSKu8PfDiiKvlyoY8h2uELB0cCIlSOdwTAKXm+wnH66L6l8ZxmzcdqUJ4jUr5nlP38PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755217241; c=relaxed/simple;
	bh=hFs0cLWyxqAwZK34s7vXW7yh2tJtIViqqYlP5dO38Js=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FW9xamXQKoWhFwB1MsP3IRcqtQyZHnupe7Cr2PEEiWOeWSEIpoz8X61cct3/55tMtUefDw1J4xLLn2NOGIvPsicSUbqYviUvGjBRqJuwHlMhE2NFbIFNkj+lUTBQNYB+76/eca0YH8K2+U9ZceVyoGorOEzHh9ACWXPHBd59fyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhlcA1DZ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhlcA1DZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8423680E92
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSZhIzUKEdyS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Aug 2025 00:20:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1646280E65
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1646280E65
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bhlcA1DZ
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1646280E65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:20:39 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b47174c3817so1087093a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 17:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755217238; x=1755822038; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLbE6JCY9Ni1brmHRZ4l8BhTOmOqCVNI+jbKD72cn6c=;
        b=bhlcA1DZ89m/QerUUPOd58ofSgXX45iTBhwSkRiy4c730zAC4r1VWCdUAZtKyJXiaY
         asiV/dpSBIqJN2hpDV0CbK4fdfQ7Jpa9PU0MTjAJSMPB8e9zD0wNpPfQcTZz25YHqyWe
         oplvZqYDM9pWuHUVbY8wDK0dZo/OX40XpwFtwNnW2CEnZwK772ViKjrGTN68mUXaVrV2
         MsvlftM6rzE1hns4MJbm/NEw0RCQuL9Z/mO2NQu1ALWNOxFIqBb9f6Pvw+id5qwqSQlf
         gc8XQwuXDJbv6/jP7x4aALPQIDi5caWa1OgSCX9NAgKARxmaPYyEfySTCW/FdgIoi2Kz
         6LKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217238; x=1755822038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLbE6JCY9Ni1brmHRZ4l8BhTOmOqCVNI+jbKD72cn6c=;
        b=JJODPZUN4sHe8Q3xBYeQsRqkRs4yr6eN7DJpFhq7pP3gep4nVT6jEfDQ2lW5gmPPqO
         ImYy4B/515s0aZdxwjfFeg+pQSJolTc/PT6H/ERHYsBT3MABKVetgfBGagUk6HxBDRhV
         TG8wY+V1mFKrrHs4ekbtaJo/b2QozRJRX0NkzSO23JrUF05zfxz3soGUqIHg+TttZDNh
         OTNEU6jgE+Bl2JKOCk58pEkksjiKXLTd9YlYaSPWSoXh54tT1NUf+8zGSadLyBA2DO3H
         sQeGH6UOnU+56oKxKs/7DXvjuoDxoNHHXcqY6EOQ5VVng/d7lgUx1dEfwTROevIC4OPr
         ty8g==
X-Forwarded-Encrypted: i=1; AJvYcCUwRl/Q6nlEjor6pZPr6LS84XfWX4AhCQNEiVC0+zZohusSCHiUd47k66fFEg32AnycYDVVBsHkCX9rYNWT6RtD+EozwQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzQ29GqbFYzXrf0AymMJdFC1pPyzI+DBYf1ONU23MA2CjU4hyTq
	2aGnmxrHTl80/OhilHZK5yuobUT99v5ZqtERiKvkxabS9/ky7dkTl+BG
X-Gm-Gg: ASbGnctEcTQzCeYPtSBDpTYJBb0F9k5jcP7eCpk3ugOif7TIlknf4fsw7Q4hlrFKxkn
	limDDls1ukgG4yhpI1UbGV431pBCL44umD17c0VMxioq+c6FQU0N3CQ3HIOIawXs9Sjeq2wbAx2
	tfZuHGgqr2BHlt4RXQrZDCIt2/sfAkhyy9mippOKEuLBGSmLyotHI42OF1w/7V7ifezyxjaiuYF
	FPkWDIgbQNFyD5jRKeSrA7pOskD8C82yjHECbkija1+BKoOnuLhNxSqsmiEoIMr83XPBLeovHRQ
	n+W4EZhSq4AVE5LIzSOwRloiILoGy+EgG082y/2USj6mKt+en6Q+OAa28TooI7Aysit5lrwFJsd
	EVHOlfoQh9DrxirqsPFjefzZOfJh9yBg=
X-Google-Smtp-Source: AGHT+IHImhF7ByRjCismIkKBnfVsotaqnqH+AYXv4duGZMCsez4RBkt7nElgUuAdHYzKpI7YQbWz6g==
X-Received: by 2002:a17:903:2285:b0:240:49bf:6332 with SMTP id d9443c01a7336-2446d939889mr1456305ad.47.1755217238323;
        Thu, 14 Aug 2025 17:20:38 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5a451esm700745ad.165.2025.08.14.17.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 17:20:37 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Subject: [PATCH 5/6] selftests: kvm: s390: fixed spelling mistake in output
Date: Fri, 15 Aug 2025 05:48:02 +0530
Message-Id: <20250815001803.112924-4-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815001803.112924-1-sohammetha01@gmail.com>
References: <20250815000859.112169-1-sohammetha01@gmail.com>
 <20250815001803.112924-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typo

- avaialable -> available

in `tools/testing/selftests/kvm/s390/cpumodel_subfuncs_test.c`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 tools/testing/selftests/kvm/s390/cpumodel_subfuncs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/s390/cpumodel_subfuncs_test.c b/tools/testing/selftests/kvm/s390/cpumodel_subfuncs_test.c
index 27255880dabd..aded795d42be 100644
--- a/tools/testing/selftests/kvm/s390/cpumodel_subfuncs_test.c
+++ b/tools/testing/selftests/kvm/s390/cpumodel_subfuncs_test.c
@@ -291,7 +291,7 @@ int main(int argc, char *argv[])
 			ksft_test_result_pass("%s\n", testlist[idx].subfunc_name);
 			free(array);
 		} else {
-			ksft_test_result_skip("%s feature is not avaialable\n",
+			ksft_test_result_skip("%s feature is not available\n",
 					      testlist[idx].subfunc_name);
 		}
 	}
-- 
2.34.1

