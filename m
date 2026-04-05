Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05862D7D27
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  5 Apr 2026 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775389469; cv=none; b=nKBW7NnbCgvmI5grPgGsgUOSYyG3zLo6pUeNSuy4hRPVyKv6xtMh1Ps8ceYyikkrz4xfFcUMHucig+LzLeXyBUCNO4pdK2CeZGc1Ym+tbDgEGCG5O5NwMdPtm6fzuIHvOdZR9yyyXHIYtwR34uES7+85JvtRPnXKP8HSUUQqwJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775389469; c=relaxed/simple;
	bh=cgZY4JYcYNuxKFJSK6ipW5wyPi1mPE0bqbjnMORWqN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PpGc7owqagauH5VMLWyaQCSKW0pdyCR87d2q4EdoiyqpFmdnELeE0ZAasmtjClgOVAViMujGP58tmYVWnWq7niOWGQKPI+l/Vzo1v0q9R8RSy0sXukW9AatzFUeVWMGbSbVnaApojWmTLOz1c2Kw3VymL1rkMEs9u/W11BF4fAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FW7h1FCu; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FW7h1FCu"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82cebbdab08so2308468b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 05 Apr 2026 04:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775389468; x=1775994268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmjALA6V37PHOvR1b73ZH9/lB8Vpxb+o5ifXzvgJEJI=;
        b=FW7h1FCuf+CpeZwtqJACNKsJ/ZhrGuWT22ENnxuDnfCLbi8NUuamKn8V3Rhs17f1N+
         Bs9pJ51umiXHC81hFINK8AOxNDG6NpWVWXub5AgPb1MApsR0TUjywrVLzTuoPwRTqu3U
         nlEw6M21uePWTIPUW9dPRufVG8PyUCN5eQfUz80dDqUoBMA7ElMGVU5FsIIYgcRDPoHH
         mdsYX5CXUB8PpLTxepvgWfwgMDqrcxsDh09aQn48CdmsWUiIuGwzHElSSXd4+XpxrDY6
         wuRuqDLZBUODRZejUVX5clp6AJEvuI29eajp4fp0ryyuSSm8IEJervjWoRwz5qNXgSOu
         2QCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775389468; x=1775994268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pmjALA6V37PHOvR1b73ZH9/lB8Vpxb+o5ifXzvgJEJI=;
        b=HfpnAwTeybKj/Wzwe/8R/tJ49kv0HMhh5ksyEqYF7CS99Fmt8HJuXP2o48YV/Oyy0O
         jbl8OoiE1AygI7VAjJ9TEclbBxPY0DPN73ipU9Pg/Lh+8C3lUO5d8y5nzQpR2ebWJqe6
         N4YoWd7EZE8tjzmoi31j9i4mO4bV4hungYBmkMfcOH650osIMzbNKWRLHLLA+7B0B/k6
         Hnxt/eF21uGZZLom/vkNvzXS9if1iZRa4NSP09dqOgiQRCKW1bTAnxeZJgwCGWR6OVNN
         cPAGrcsX4VODr/PAtJmR/1xWngW3am9kAQ+P/3fq8j3E4YcCzkjfiqaeLsjLdfkgxmar
         ARGg==
X-Forwarded-Encrypted: i=1; AJvYcCVsXhowxei0wxoMwCwbkZZFF10XslPjL81vHmDMFBPnQlfbqB9hWTvwz8FGS/r+nLKDZxcoSo0bX6HakXUPZX2QVb/p2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAZbmVmyJ3FiW+RSftVtlQM448bnfTzdCo2uRibJz9eHGsUbrT
	2oL+7ZJOzLuG/1aIVNd5kRyDHH0MXKXcbT+iqdnrw9yfgQLn72NQrakq
X-Gm-Gg: AeBDiesqF4OFlIWo8XRtWZVQUN3mpML+gL9navVfERoY8ebAS+ikZ84KqcCO42Ms1aA
	49AbxzsJ4TgeeiNdY7vhkk4orOllnmhLJdxWRm3CQT8QRD+DmIJZUlHxJwN8z0EDhLfxi0nmWw0
	uL/RhPsyw4DLjnsSZxLxszQSsB+3BxScuxPYEfYCV1RqGr7BdAvp+m310kz7i3lkNEHUd6sbOBs
	bktPlzsdyLJiprzXPp2yC+vJ4wqEqcZoEFQOL6DocVQ0IJwUEVNyQGWmEugaJe2zM54b6hDq0rP
	R1yNoHbF+gyw6MWV06CkRgyO0YNrQaKEZ3C1EtxrXUrghpd7nqrGfWCv/TfA0/ZqcCfbIzBQrI6
	ofnwJSIH4feBKcwjCfw6KG1HBWkj25xT34vwZjE5i1jmuUspXZBdEN5FTpReEaN3TQPyB+gFZyO
	LdPW+uk3s/dN5dHWj79SZpNuWHVsloQ7ru0xGj+hM=
X-Received: by 2002:a05:6a00:3027:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82d0dba9c6fmr9220951b3a.43.1775389467970;
        Sun, 05 Apr 2026 04:44:27 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm13938205b3a.19.2026.04.05.04.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 04:44:27 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	weibu@redadmin.org,
	knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com,
	samasth.norway.ananda@oracle.com,
	lukagejak5@gmail.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	suunj1331@gmail.com,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [RFT PATCH v3 3/5] staging: rtl8723bs: simplify boolean return in IsFrameTypeCtrl()
Date: Sun,  5 Apr 2026 17:11:30 +0530
Message-Id: <20260405114132.310774-4-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260405114132.310774-1-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the simple if-else statement which checked value of
GetFrameType(pframe), if equal to WIFI_CTRL_TYPE, function
IsFrameTypeCtrl() returned true else false, with a single return
statement returning true only if GetFrameType(pframe) == WIFI_CTRL_TYPE
otherwise returns false.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/include/wifi.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 230b2c4ffd3b..2876f15f13d1 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -275,10 +275,7 @@ static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 
 static inline int IsFrameTypeCtrl(unsigned char *pframe)
 {
-	if (WIFI_CTRL_TYPE == GetFrameType(pframe))
-		return true;
-	else
-		return false;
+	return GetFrameType(pframe) == WIFI_CTRL_TYPE;
 }
 /*-----------------------------------------------------------------------------
 			Below is for the security related definition
-- 
2.34.1

