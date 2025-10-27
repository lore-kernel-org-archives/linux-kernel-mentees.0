Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4FE222575
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761541756; cv=none; b=D7W9/ZCAVWN0RUu74I8+RDekU+7eufMCatPIbdas2bC5DLPnNIm2W105hJz+xDrHu1kXjRftePeY1/AFMfWyLZOIxIXnwlN/z7Oah7/WVhUpcsT5u+VvrrJBIIEzzlpvPJnYc+LXjzvRB/9+WPV4S/56p8WfP+D/au2mFtHAFSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761541756; c=relaxed/simple;
	bh=OUqLcKZeL7sNozc0Va2ked5/A40+JIYc+5qBszOKEbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YG1r3YEivptsCOyoVrDEn1s7owH+aDZIBru++oWqhHR/zqonIvDvvR0TfleRpXqWSRSevk+4pQwRHUGn5mOzq9OqKepyphi79ivXyH9Pk3RJ8dcFX+4pN/jx/9qDbaCTqpdRx3mm5JjL1e/BpwfmSeFReCJ765jO35n4iODLDg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1opVQvv; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1opVQvv"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0C1C8129A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiK8NU3c3sro for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 05:09:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com; envelope-from=ankitkhushwaha.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10CDC81296
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10CDC81296
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i1opVQvv
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 10CDC81296
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:09:13 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-b556284db11so3548922a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 22:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761541753; x=1762146553; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0q0YaFBfANSAS3+T3VacFx8v2x4tPgl7we+mN7jZKc=;
        b=i1opVQvvdM39YjQFuxxHmyfUHAo7rujNjYG3D0+00nEEiumFFSnnyIVYI/mfhiZGtV
         1DuvkLyF3NmV9QY1t/I9N2XiVnxfA3HREd+oSAyW4ujXwPaxsOGutY1FaOWQRo3eWeNW
         07nBdNNZ3+2RCOQO4Xo1c0mol8KiLl1vZteU2gX3PjCZVr6pGvzsGvyKqvOP3JhEhBld
         s2eZy62Hd0JQfmDod8V5/cRLOsmB4evVEpY//otRNKE6SnTVEBhLenjY6w+9l8Ob1CVJ
         cGIMvd/pcpewsbNe25sqNgH2LqIGn8sc//6CTsIL7y0//QNmD+PPTYhDfObplnD4IQpw
         CEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761541753; x=1762146553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0q0YaFBfANSAS3+T3VacFx8v2x4tPgl7we+mN7jZKc=;
        b=oKUVWI5sFIk9vorGpSQ0mcylSZddCcxt3JeplEhL2j3+G9Y2LtMxjLUqv5+ftXokvO
         b9vBilk/6d2yRjLngGvhaZpMdAtYo5T1kAKU9XZ4O801FBZEQl4yJqTeIoHy0KBCpD5a
         2i9UU8/wbgQJrP/3SqqJ+sSKCV6NKxbJmtVgY1L0WyzFh6p/Fa4BGWuO5Mtm8oqx9erp
         JEx4siKLJOFrq62bPm0iy7boL5w6+usIy7qePsVzaum65NfxLt1ShNzA+Trb1MhuRZZm
         M83ywz+0xnET7IPpixY/fnFtlRa4i+QjjUAWm+WeLSCplAEKXiDy8v/MSdOlgmnkRfMB
         p31g==
X-Forwarded-Encrypted: i=1; AJvYcCWey9UfhrNKqkdi6yca8ABNlzb2Hs0F63IjYaXchuOnXzsFwX3/l99oVuiuIcdu7xHs2euPBkwVKRFbW8BEheMDz0giZA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwtRlvPTBwlcU8MoPg4f7bG+lOgAs7qdo9YyRhIhWvRZTOfScS6
	QQ2tchKR68KTE2sWbZ+Hn54/j2qSQikDqtDiHvU9CvOSYzz92dFX+Bfm
X-Gm-Gg: ASbGnct1Jtz9SLa7QSqblEOy7a013y13HSZPUbEmPFP6cU3lMEYFI4tNvrmlIaaMca/
	heV7tr1qHU5ZRQFeJwZgcWZhJLDcUbFIIMn26oK99amxf6FmkyrRsK5FVTDdPS9UNRK6iFPvRHg
	+Iin0WIs1UP9aAcKYlK5hAe0gnntBD6+cFgD2VQwHLOlDkuVJV4FWhKKD7aLcSBdd8laNVOH0PO
	D+LffH57wlI6N/VFp3Yd4PRUto8xgthLXYwh4R/lzlCyk8hncESagveL7FJDFJ+Tu/tPMMSTFyL
	zMXxDsTlXjjb+waKzqRUGOHI46N18tRqP4zMpMzQqPD7cpG7nfrUZbxbhd7EmXeB/HfNisfwBlk
	BZdx3i55B9zOUYbF+6wAiFGY6PY1Nvzb8HdXomPenGqjQDj/R0q4ZN07bFarALC2zhnJjS2F5Jq
	EyvIC7UwuF+tlCYYMgeb0=
X-Google-Smtp-Source: AGHT+IGtH6XbDGJuGDFIuaox3wBmr6QQpVXy9N2GYRgtuZR8X9dTVLYjDB8WtOHQERgIjr6dDk9zog==
X-Received: by 2002:a17:902:ce8d:b0:272:a900:c42e with SMTP id d9443c01a7336-290caf850b1mr476300195ad.35.1761541752993;
        Sun, 26 Oct 2025 22:09:12 -0700 (PDT)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d23226sm67843525ad.49.2025.10.26.22.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 22:09:12 -0700 (PDT)
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Xing <kernelxing@tencent.com>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Subject: [PATCH] selftest: net: fix variable sized type not at the end of struct warnings
Date: Mon, 27 Oct 2025 10:38:56 +0530
Message-ID: <20251027050856.30270-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some network selftests defined variable-sized types defined at the end of
struct causing -Wgnu-variable-sized-type-not-at-end warning.

warning:
timestamping.c:285:18: warning: field 'cm' with variable sized type 
'struct cmsghdr' not at the end of a struct or class is a GNU 
extension [-Wgnu-variable-sized-type-not-at-end]
  285 |                 struct cmsghdr cm;
      |                                ^

ipsec.c:835:5: warning: field 'u' with variable sized type 'union 
(unnamed union at ipsec.c:831:3)' not at the end of a struct or class 
is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
  835 |                 } u;
      |                   ^

This patch move these field at the end of struct to fix these warnings.

Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
---
 tools/testing/selftests/net/ipsec.c        | 2 +-
 tools/testing/selftests/net/timestamping.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/ipsec.c b/tools/testing/selftests/net/ipsec.c
index 0ccf484b1d9d..36083c8f884f 100644
--- a/tools/testing/selftests/net/ipsec.c
+++ b/tools/testing/selftests/net/ipsec.c
@@ -828,12 +828,12 @@ static int xfrm_state_pack_algo(struct nlmsghdr *nh, size_t req_sz,
 		struct xfrm_desc *desc)
 {
 	struct {
+		char buf[XFRM_ALGO_KEY_BUF_SIZE];
 		union {
 			struct xfrm_algo	alg;
 			struct xfrm_algo_aead	aead;
 			struct xfrm_algo_auth	auth;
 		} u;
-		char buf[XFRM_ALGO_KEY_BUF_SIZE];
 	} alg = {};
 	size_t alen, elen, clen, aelen;
 	unsigned short type;
diff --git a/tools/testing/selftests/net/timestamping.c b/tools/testing/selftests/net/timestamping.c
index 044bc0e9ed81..ad2be2143698 100644
--- a/tools/testing/selftests/net/timestamping.c
+++ b/tools/testing/selftests/net/timestamping.c
@@ -282,8 +282,8 @@ static void recvpacket(int sock, int recvmsg_flags,
 	struct iovec entry;
 	struct sockaddr_in from_addr;
 	struct {
-		struct cmsghdr cm;
 		char control[512];
+		struct cmsghdr cm;
 	} control;
 	int res;
 
-- 
2.51.0

