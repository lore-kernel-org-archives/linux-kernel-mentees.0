Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D8F1F462D
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 07:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753341658; cv=none; b=YJz4r47/ZbSEqtHNF5DVtSUeP+L8yajnKyvOPm9lsKYYCLVq07H+WV/yzT1rbAIs4P7xuJRI4/VINLLk+EslXuux5PLOHV2ruuXNaucqmNbRvgaUjQvN4Re58t+tFIy9xJnfouEf3pi/s9d+MJKn3DTr/NnTIq5LYfmcDEqf6SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753341658; c=relaxed/simple;
	bh=4NHFOrnlJxQrpWKVDw/v6IQ1txu4TtPqma6pCCMo7x0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0GptT4rfYYN6UcUB4lpKoyqN6oMi3CN3Gkaf+fxDJJD/1p9v4jSchhQuQbQ7Fsn9DarJf2wP3gohxA9mAaMeXuyYidOjFvWqrUbWkhDD8zqqaV5ZYCj/YOR8ZDagn4omgLyPyIiMqRaGAFgDH2seKiRCd9X5nacUQs3cKfQsUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=HMB9dA1p; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="HMB9dA1p"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so6282335e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 00:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753341652; x=1753946452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S6sDyX31bMtEXVDsFLGoanfMyP7wfjYxyF/aDso/gRs=;
        b=HMB9dA1pizaSm1FQgZ6mZFWJ2+Poho5boQA2bloIrxS+Y0A1TwDDwzxbcvHXbUPOE0
         XjGEHE7UAhjx1+Rch8GA+0+Tzeznad3NLqdNjVnV1cIL3thoEJPDlh2IE2PQOZ5zAeop
         QnvrhI5ZrewZSfA/vry/jATM4UvMYZdGAXHuKBQb2zBOBpDqnETKlxNLWyRLWJlwtjM/
         zg+PQo8QfxELKHLgHRLKDdEH7k5kOgOX+TGXZEzSjS++m4X4Qc47t8Fcrn/OdP5DEKSb
         ud0D8fr4uVosbcQVncNNziuUPEVXjyX29wBdT+zFepgRhlxE+WxEuaWFs0oaWZntr9nM
         mIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753341652; x=1753946452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6sDyX31bMtEXVDsFLGoanfMyP7wfjYxyF/aDso/gRs=;
        b=wqbS0kO9f84OCS9Xo8CWO1/qdvsQE6C19/RfLoXyOQRa6G08z9e9xX/Yar+1oKqvKz
         62xFAd5vR8sYDuB7Du0+vCzh2ftUGf5rqYRo0YO+tB28VGawgjdu+h4HaPNNl5FBs5dW
         674lj+M/l8+bIPSOUMjVtxoNVyacAdpCgG4lSKavm9mlH0lbH1xWzADyu224emHanKUo
         RxjdST14EGTdiPS+QtrlDUamePQL7zAPm+ZKFvgI2MIvbeME5j9yARoCXGz21hN79qfH
         G+wueH+pu16/ODvbwk1BXfd+JitO8cW5kqQzVavxbkGkyx3SSk3IiQ7A2WfEw50MehMG
         Vqpw==
X-Forwarded-Encrypted: i=1; AJvYcCW0Bg4w86qlNifLzTmBYdkeoveVB0NpRKvHO4OVavfLLFvgG/Ek7gqJI1D44DklcxQbQjRqXKCRwijcInumlgmeRJ9G+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvFekpCwi+kne6wtdaPIXqe1wxxW4Zn6vG2IVcGklChsdTT3Qj
	3WrPB5PJ3SC2Zj1jsq38htBK2KqnUjYb3uSKLFOlrEiueqzQs4Ll72yEwtgA38Z7ug8=
X-Gm-Gg: ASbGncveMdcmBAsobHhehxzSCUMidCuZbKLf0cy6pjFq9bMpB3s2uaIM/P3w4BHNOjz
	DqJu23gfF2SwTP70Zx0B9HcjzBzLPi6pkLPgPAq0Ci/0ASkc7PCh5Gq7Cj8zsbUCg7IZiNh2rPn
	MaIgqDwxZuBu/8MEZsIjN7qlOaIoKYKqNiqqvZQm/1hG7bKYlH4/X8w9VimR7QcJLwmY3F6iWhl
	ulvrFhYER6lXNeC+tIzuQ2VdSNGWcnj5XYCBeMgOpijym24z4RIKVfZZB3N56ZQ/shsvNqkh1hV
	n934qXnG+D9k3h4yhuvtMLer/GgiWwftbCKzSF17Joc7a5aqajKom+6/7j2VjrP8ELUWFCdzSM5
	moV7jNR7P9y46abfZDDnP34IOEkClWHW5AmiS/+8TXmq7owryWg==
X-Google-Smtp-Source: AGHT+IGtoPxWfQ+wEpGjs7bUDWFQ1oeDB2sB8phuc/KoP2/+fvLeJ4l89nxhivkNTcUZ5qQxIwrrZw==
X-Received: by 2002:a5d:64e1:0:b0:3a4:bfda:1e9 with SMTP id ffacd0b85a97d-3b768f079a1mr5008877f8f.46.1753341651795;
        Thu, 24 Jul 2025 00:20:51 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:871b:95ed:fb39:f517])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc6d32dsm1253844f8f.24.2025.07.24.00.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 00:20:51 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com,
	joe@perches.com,
	corbet@lwn.net,
	apw@canonical.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] checkpatch: validate commit tag ordering
Date: Thu, 24 Jul 2025 09:20:32 +0200
Message-ID: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modified the checkpatch script to ensure that commit tags (e.g.,
Signed-off-by, Reviewed-by, Acked-by, Tested-by, etc.) appear in the
correct order according to kernel conventions [1].

checkpatch.pl will now emit a BAD_TAG_ORDER warning when tags are out of
the expected sequence. Multiple tags of the same type are allowed, but
they must also follow the order. 'Link:' tags in the changelog are still
allowed before the tag sequence begins, but once the sequence has started,
any 'Link:' tags must follow the ordered commit tags. 

Link: https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#ordering-of-commit-tags # [1]

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 Documentation/dev-tools/checkpatch.rst |  6 ++++
 scripts/checkpatch.pl                  | 40 ++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 76bd0ddb0041..696b42bf4ff5 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -599,6 +599,12 @@ Commit message
 
     See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
 
+  **BAD_TAG_ORDER**
+    The tags in the commit message are not in the correct order according to
+    community conventions. Common tags like Signed-off-by, Reviewed-by,
+    Tested-by, Acked-by, Fixes, Cc, etc., should follow a standardized sequence.
+
+    See: https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#ordering-of-commit-tags
 
 Comparison style
 ----------------
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 664f7b7a622c..267ec02de9ec 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -661,6 +661,24 @@ foreach my $entry (@link_tags) {
 }
 $link_tags_search = "(?:${link_tags_search})";
 
+# Ordered commit tags
+our @commit_tags = (
+	"Fixes:",
+	"Reported-by:",
+	"Closes:",
+	"Originally-by:",
+	"Suggested-by:",
+	"Co-developed-by:",
+	"Signed-off-by:",
+	"Tested-by:",
+	"Reviewed-by",
+	"Acked-by:",
+	"Cc:",
+	"Link:"
+);
+our $commit_tag_pattern = join '|', map { quotemeta($_) } @commit_tags;
+our $commit_tags_regex = qr{(?xi: ^\s*($commit_tag_pattern))};
+
 our $tracing_logging_tags = qr{(?xi:
 	[=-]*> |
 	<[=-]* |
@@ -2712,6 +2730,8 @@ sub process {
 
 	my $checklicenseline = 1;
 
+	my $last_matched_tag;
+
 	sanitise_line_reset();
 	my $line;
 	foreach my $rawline (@rawlines) {
@@ -3258,6 +3278,26 @@ sub process {
 			}
 		}
 
+# Check commit tags sorting
+		if (!$in_header_lines && $line =~ $commit_tags_regex) {
+			my $tag = $1;
+			my ($tag_index) = grep { lc($commit_tags[$_]) eq lc($tag) } 0..$#commit_tags;
+
+			if ($last_matched_tag &&
+			    $last_matched_tag->{tag_index} > $tag_index) {
+				WARN("BAD_TAG_ORDER",
+				     "Tag '$tag' is out of order. Should come before '$last_matched_tag->{tag}'\n" . $herecurr);
+			}
+
+			# Allow link tags to occur before the commit tags
+			if (lc($tag) ne "link:" || defined $last_matched_tag) {
+				$last_matched_tag = {
+					tag       => $tag,
+					tag_index => $tag_index,
+				};
+			}
+		}
+
 # Check email subject for common tools that don't need to be mentioned
 		if ($in_header_lines &&
 		    $line =~ /^Subject:.*\b(?:checkpatch|sparse|smatch)\b[^:]/i) {
-- 
2.43.0

