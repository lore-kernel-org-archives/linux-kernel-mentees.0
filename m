Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787641863E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Oct 2024 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729954844; cv=none; b=oByxBBV6YKGN5RR76qAAKkX6VomZcYlH8tiWC+ARsFhBuE6nkUmCACPb+PfDDFD88IJ+hHTyyHd5YY6SEGVf0mxck7qLg+YEQtMWDlp4DkBeR4G4A41s4RnkBpF40J6MMH0oeO/Phmj9Hb0V7kEk8q6fI6kOyyx9hsH1O7HyCRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729954844; c=relaxed/simple;
	bh=1LOBijO8+8t8Q8WP98HjEGTmpGQ9fmPyBouPtW6mbBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/PH4Dk1qSEA8CM/YI/59O/5ELUJS3tR1d5IVKtoRpvpjQ92RPb4FhIVqFy+EZuCjRmRkXFQ/mncuk/1vOGupxAtt5AimEdO0fRYqwcvR71HyHSQi9iGkPgTDTEIts/mGlvvKsyTYB/K+zYMBSlJ/n8W1SWFlLIPunqg7TkpAXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=FqorxNqV; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="FqorxNqV"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0527A82038
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Oct 2024 15:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yi_Ub7aZzHUI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Oct 2024 15:00:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=149.28.33.109; helo=lichtman.org; envelope-from=nir@lichtman.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F7EE82035
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F7EE82035
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lichtman.org header.i=@lichtman.org header.a=rsa-sha256 header.s=mail header.b=FqorxNqV
Received: from lichtman.org (lichtman.org [149.28.33.109])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4F7EE82035
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Oct 2024 15:00:41 +0000 (UTC)
Received: by lichtman.org (Postfix, from userid 1000)
	id 1946F177103; Sat, 26 Oct 2024 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1729954840; bh=1LOBijO8+8t8Q8WP98HjEGTmpGQ9fmPyBouPtW6mbBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqorxNqVryyCnmkG7CnSzi+K4LAaFz3iVHymQ8XnzFQRDV0KKe+Ri2Pdxelw3JyJu
	 OfcVCmxi7fx/zmjOIlNp8Z8GKWbj7ejhBU8kAM3BZ7nHJq/Yes9hUi2BEeRAh/VVIw
	 DkoMMi4l2baedUUvtuZ11O3tbcc+XxdQz2b07J+Bev4ojAuXkGaxTv0sDcrG1MLSyE
	 kf/3vHla1Gk9Hg1dfaANa4Tm1Hk26iv8wpTemjeKuBWd60xYK2SlEbMfs4MNjx66kI
	 kbmE78YmihAhLLsRTTCub7vUMfmP10mXigt+pyGJV4IHsyVP+evmLEbC2888xl/N46
	 J8lCxn2CIGlKg==
Date: Sat, 26 Oct 2024 15:00:40 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Cc: yuran.pereira@hotmail.com, jason.wessel@windriver.com,
	daniel.thompson@linaro.org, dianders@chromium.org,
	rostedt@goodmis.org, mhiramat@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3 3/3] kdb: Remove fallback interpretation of arbitrary
 numbers as hex
Message-ID: <20241026150040.GC892629@lichtman.org>
References: <20241026144724.GA892311@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026144724.GA892311@lichtman.org>

Remove logic that enables a fallback of interpreting numbers supplied in KDB CLI
to be interpreted as hex without explicit "0x" prefix as this can be confusing
for the end users.

Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Nir Lichtman <nir@lichtman.org>

---
 kernel/debug/kdb/kdb_main.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 930de4fdc708..d929a4335078 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -402,23 +402,15 @@ static void kdb_printenv(void)
  */
 int kdbgetularg(const char *arg, unsigned long *value)
 {
-	/*
-	 * If the first fails, also try base 16, for us
-	 * folks too lazy to type the leading 0x...
-	 */
-	if (kstrtoul(arg, 0, value)) {
-		if (kstrtoul(arg, 16, value))
-			return KDB_BADINT;
-	}
+	if (kstrtoul(arg, 0, value))
+		return KDB_BADINT;
 	return 0;
 }
 
 int kdbgetu64arg(const char *arg, u64 *value)
 {
-	if (kstrtou64(arg, 0, value)) {
-		if (kstrtou64(arg, 16, value))
-			return KDB_BADINT;
-	}
+	if (kstrtou64(arg, 0, value))
+		return KDB_BADINT;
 	return 0;
 }
 
-- 
2.39.2
