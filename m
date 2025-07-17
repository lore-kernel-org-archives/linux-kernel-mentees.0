Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14B529AB02
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752753592; cv=none; b=VzfWuTzkejDKdt127W+szuwnHWE58JYdESqj8unSiahl/zs+OoXvN0yQryLhdTHHkZxfV8sPPRlRTXqKyDmWbt5vnhwSiE8iCvUHan+2OsDEX8KlMzGpMgqp/6z1AH3Ks3pfNjTSEkwSBZiLFRS2j4Z0iri2Cf+mFpnnnLUP8rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752753592; c=relaxed/simple;
	bh=nkcmylT9yipRsOBI6uhXOZOwKH5/VJoxCifVdfyQYUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FNbDuBvTbL9MU3sx8wfz1A90npeH5XkT8GmbSw+ZvB1eJ66B8/+r83r+2VCaYcBZoVWpO6IKepXTBS+CJfz4p57VJSyF+dyM5lOvhJekHP+ROl4pC5huN3rbrGI7veA+9VPNAYx76skBInGM9yChPvjh2LGklpcCQVkQdTHwuvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzLCaFvG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzLCaFvG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23c703c471dso20597445ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752753589; x=1753358389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PbLRuGBCBDgfVU6yEnMIFZuymSG0mxgBMi0dHo+HMI4=;
        b=hzLCaFvGSHNzFQkBki0tZ4dKOgDnnGl9cz2IDGMtCiA7T9cOEi2d+AeJ10mKG2o5y1
         6m33inuJFAmhDHo/cQb2vyY0nkfLtqSgMQLIZ+hrM9zOn4BlBiD4Ajt7N4ucz3ONNmR6
         B+Zct33CB9z6GvGN7d1VC3bl+FGbO5xkkugD7kbvzN5yJUxQrvNvCUZCJ5F9xucDXQp6
         GyPugAZjR/wcRIPVFKaBn3k9Rz3aV3TKPeuzc/miwCPvLelauyK/lmQIRlJ2gRMzRtrT
         JtZAXjR/nI2w3hT3PWowqwyxbuJe8bJ8IMtcftuA4TFx9f462G6Old1v7NQcTC+HF6El
         JN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753589; x=1753358389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbLRuGBCBDgfVU6yEnMIFZuymSG0mxgBMi0dHo+HMI4=;
        b=b4CzQUlI76jgfxuh3s1fgTLHo3dO+lXpa4Js/LnFV7eRGVa+AiLdmi4i5nOwz8avfA
         Tl/d+RsGR+QTmUAmbxJyECpVtNwaddWpqk9aaFAN11N1rLz2DmC1Sark7JpOyMSq60ER
         aS5iCiKS/cCnDdLgV8IBd5Qjarcnp8FQYX5JnYd2q790CC475LCUnT9CgKzsndEfhfCA
         Olfmsff833wSv6WVN5RqR0YRIb8qNCTHZhYHJsNnmsZfSZVvHCtuSfMpC608gKg9BvM3
         SgNzHQCPx/DB84m6p2ZXBQIcdGIK3kgW8QuerHwpxuOHzB5gzoZsUMSpc1zupvOLLSZ/
         oJXA==
X-Forwarded-Encrypted: i=1; AJvYcCU/JK2tz73DJlAqdIx8Qh7pJTuDRtVMdhqlO5RUY8fekZ4/ENpoZScLsiAEyIYfpST6Xakta4O2YGoZn9sb/jDDlByPtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDjPBO3QfKEtwn/1qz4DNKwdtIpcpwHhyLj3jqX8mQS+wmpP+f
	1soAd6dlg0YSbTnTft0Rwtc7IS3H5XK/DR6uesx646eoh7SckL0WyLt7
X-Gm-Gg: ASbGnctcqO9By/pH5/f4ztizE/n3JptkTr74AO7IQuIn17DozvCAKeY+DDS4em62Z2N
	hNyvCuQM2Zzoz88jVguZQbYvyaiy4tskfaqZjxK9KtZHsyRSGr3f1+zkGSiadAgz7pRzeJGftKQ
	tn9g0gjLpXr3mqgHxfh5/FodiqISf4X3lIRm9f3Mx7Z7JpZRwFz8Hs+bRl1/4xVW0ri10lMPc5Y
	goVqzrIqiB4L3nJOk5hAFvC0jqSoLCFnQM5e9jnW6bhvfkN0Z5OSU5AlFbHXM3qD1gU5Ucu7k7L
	JxrYiQ/P/ZEsnupnzBOdkRm4aGGGOIJyLPBrUfxjb16owBZVLsFvJY7+q2DroJVXbRIMGo3gBw2
	bY71fFBJSQT3BtOJkyjZMOqRlu78UFw==
X-Google-Smtp-Source: AGHT+IE7gXMblI4F3h/n2WJ5+86/B68s1uRAd1eAVRlCcY9lkPK3X73PWe7RYmr9PH2N+slxR08t+Q==
X-Received: by 2002:a17:902:bd4a:b0:237:e3bc:7691 with SMTP id d9443c01a7336-23e2f704bbamr31439535ad.13.1752753588815;
        Thu, 17 Jul 2025 04:59:48 -0700 (PDT)
Received: from archlinux ([38.188.108.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322890sm146172075ad.136.2025.07.17.04.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 04:59:48 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	bpf@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] libbpf: Replace strcpy() with memcpy() in bpf_object__new()
Date: Thu, 17 Jul 2025 17:29:36 +0530
Message-ID: <20250717115936.7025-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the unsafe strcpy() call with memcpy() when copying the path
into the bpf_object structure. Since the memory is pre-allocated to
exactly strlen(path) + 1 bytes and the length is already known, memcpy()
is safer than strcpy().

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 tools/lib/bpf/libbpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 52e353368f58..279f226dd965 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -1495,7 +1495,7 @@ static struct bpf_object *bpf_object__new(const char *path,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	strcpy(obj->path, path);
+	memcpy(obj->path, path, strlen(path) + 1);
 	if (obj_name) {
 		libbpf_strlcpy(obj->name, obj_name, sizeof(obj->name));
 	} else {
-- 
2.50.1

