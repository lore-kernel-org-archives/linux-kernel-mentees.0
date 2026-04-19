Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C32EED8
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Apr 2026 19:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776625597; cv=none; b=siQ3BqwIGFpdKf73QfHc9Ac3odifNRAlgd3fZzL++1nIoY0oqnFzrwdo14goaKYKQU57gRizO6n6pAy4UqTX6pd5G/LOvdYyAbVDC/xqFUmBHrH6b6XIC6yiODqwU7QPAhrkx5tjOUbYnzJPOX5q6iHTRAYDqsNJrq/j2j9Rteg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776625597; c=relaxed/simple;
	bh=toOFf2xg142rVKdQsq5pdhGPVdznNk8pu3Hk5d0NOts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YRuMPZCHbBL/OcwT3vxOO6D1P4PCkaZzVsmw2MY7dwOgriWtbZVnN+lp67AZKqQ+QaMXkq6cHSiQMdiLmAdIWy0+0tkjl2MYsmOKdF1p9cEzdzyeuo5uqVrFVDF9yp6Pksll8hGArDvs1RyUZ9dP1tB4xslFCLB9hXsydo1vN7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONhxu+cX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONhxu+cX"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b2429f98d0so11880235ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Apr 2026 12:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776625596; x=1777230396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYwumL6ukXBAj/RoXbmDU80+PEG893ZgwxOy7tBa+0w=;
        b=ONhxu+cXywTo/Xel6oaSoTONXLup4u+YJxdgJSj9rdiSLGTm7hsZNhKZ8wI3QdJsiQ
         s3m/w2f84ZTWnnKRZzo3ytbtDQpohkGYd1K5E+be7jBHUIbiMC5V8Kd04E01nMaITyrQ
         4UhoKdFWXtYsWTH8msWmnUvolMl/xz8ALAo8jOL+MImtOEi9OZYtxJFBqRsOk74e3YQI
         oLBhbv5JffiKrEHHdlZ8imarrdS10X++0qHsjZnTpifpelq2ddFiL0Konzk+QxjAbl6V
         Pi+ArKsB6CSJZPsGS3zrKNEZQCAMzV9hM35UioWT/9ZhxnXC50u+qh75X5NNjymZ71OI
         RBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776625596; x=1777230396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYwumL6ukXBAj/RoXbmDU80+PEG893ZgwxOy7tBa+0w=;
        b=dNF4a72YO/RljG9bsyzfCqa/f++to4Sd4x4/8BQ3O77Q2AJHCT+dIouGeeE6kZ0L2a
         Z9dQoah8ogauiCtDYWu9YXb0l9Rh2EE/Lkfz+YGDCkEiPJtxx4pemkPzzh3UYjh44oZ2
         vWpNjkVoe4gejXLBVUgjtoc3e/Bc19sOHPnCKZfsbynT6NEhX3/DVbC/bDfie6Gv4Yi6
         i1AjVz9EPNRp81tIBV/p//h4y6NiWwSKUEvfWIJSRCIqnble0nhpihozIaXc4FSGsfkm
         yCt6WpOCFvegMNU1UU1vcWw5waezbXbnRuNrbfJM+ydpZd6hfEvk9wQip0QrCn9WeA0B
         RyZg==
X-Forwarded-Encrypted: i=1; AFNElJ/42YVQ/GmKQ+cFOVNH6L6N68SBzMpNWOrOBGYNNIpvJjRgPg9KFNZEkdNUgm2QuF/zjZbefDpY+21NE66O7O1VtZlc4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAhW+oEiU+NDlNhKrYPgUQqqwTfXGIfW1gBHqHXlsqmWCSUgc6
	K2/J6422Tpi5iunqdbzSpJK5CLFQAfMRnl5YFeonGbo3rT2+c3M0yMAU
X-Gm-Gg: AeBDiev5teRIQTcqJSItVXzMcXqcmkKyfa7dixJ1Am4RdOF0VlPIY9NohDi8yJJnCUr
	dreYYWFiNvclMriJzUL1el4QUa91KZx4xJ4ptz88LCoU1+O0ME26qYkROopBKNyrAJPErYNoCzy
	hO4kphX1j+W3+QMLWYgHKMfhyHuKfvYcqGTm00NyNnYs97s34lEdkwKt+8pizPORCxBYlevZNG7
	b9p8oWhyuq2BRVF2v3nkf57+okVp7ruMJhLXhGdDQgpFah7J7k1a2L5fyViHbFTYOwFOOmgNOu3
	hm/zFMJ1yny5FEA8FrSXWOdsWGqAnJtjUOBLKwcRHlpyKcgK9sqF0ww0OoHrQaUOdYgHXezcSog
	ZM2ciI2DGjJ1fXVUZ80VTPS5P/F8n+q11AO2/ow8OqoQuA6o6OFysf2SCPy6kBmL2eo6edhO8TH
	8qIU8Jbf8jkmmwtEndKGfrm3mlBRqNXSJTsoasXmIoi2wv+P2azp/chORGCG3oPN3QiCEwNeZVn
	WzMSTBKWeaDqX88IQ==
X-Received: by 2002:a17:902:da8f:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2b5f9e773f5mr115776375ad.8.1776625595761;
        Sun, 19 Apr 2026 12:06:35 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa17632sm81585585ad.24.2026.04.19.12.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 12:06:35 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] Documentation: fix spelling mistake "stucture" -> "structure"
Date: Mon, 20 Apr 2026 00:15:27 +0530
Message-ID: <20260419184527.779828-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixing a spelling mistake in Documentation/trace/histogram-design.rst.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/trace/histogram-design.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/histogram-design.rst b/Documentation/trace/histogram-design.rst
index e92f56ebd0b5..41a726cd3536 100644
--- a/Documentation/trace/histogram-design.rst
+++ b/Documentation/trace/histogram-design.rst
@@ -247,7 +247,7 @@ field's size and offset, is used to grab that subkey's data from the
 current trace record.
 
 Note, the hist field function use to be a function pointer in the
-hist_field stucture. Due to spectre mitigation, it was converted into
+hist_field structure. Due to spectre mitigation, it was converted into
 a fn_num and hist_fn_call() is used to call the associated hist field
 function that corresponds to the fn_num of the hist_field structure.
 
-- 
2.53.0

