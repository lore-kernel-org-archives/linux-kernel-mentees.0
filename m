Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AE2FBF0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 22 Sep 2024 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727017890; cv=none; b=YrCvCPn/BADabDINMe8zQvGIGniUO5KYPr1jh9cP3SkwN6pRXwjq0hBK68O4gfkBcv8UE7iHPRUrY3bnDML5CKOnb4YUB8m0CpCrFaGdD4y1gQoOsLjYr69f50Lfi1G+mp/XKlw/LCD++gJiaZeNO3Ir1VQyfKqxS+oCfiafNZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727017890; c=relaxed/simple;
	bh=i9XCB8m7qYule9muylEf116wS7isyCTJubzHPe8ofZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Giks/eHmW6PxFQGgRYyLuPPJVft+S4igAFbz0zDZW13xfc6gGXLcOuNYPNdq2gPh47jPMcZ1zmFkI7kqjDTpJ7EuTbVEMUgXfP4Z/JCfLvhq3ocbJKOaabb70RuNwkaGC+4919W4RyMKuiDMlhUpoWKqdogCiKFW5nYWJoaAO/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLytZqJJ; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLytZqJJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D0C760682
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 22 Sep 2024 15:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhTEmDvamhZ7 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Sep 2024 15:11:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sj@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5578B605EE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5578B605EE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OLytZqJJ
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5578B605EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 22 Sep 2024 15:11:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50B6A5C0068;
	Sun, 22 Sep 2024 15:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E58C4CEC6;
	Sun, 22 Sep 2024 15:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727017886;
	bh=i9XCB8m7qYule9muylEf116wS7isyCTJubzHPe8ofZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OLytZqJJUd7VwLMxOF6xDjhI/ZZcBeJV6FnnllQvG3BlF4rhSsa96t+5fCucXWf2A
	 D7NrCx0V2MlaKc7/CASDrLGm3oh6BqC1EEnPTdYcWC0gxtWIH5pzBGSeCK9VLZghdl
	 Z5CYylP0YQCigRgwkf3oMgRf6bv3pwBhbxDdtw6v7bxvmbjHEjOBLbzfcPqWs0RJHS
	 azW9f/WwGZv3XxnCDF6+ugNeE32eRB3pb8DIjFfs72tKo66rnGxWY2XejeyqHPwrof
	 eagtZI70RV904N+nrcPzM9JNsH1OAO9glYPfZX73eV1TjQENjVirydD6ggTJDI0tU+
	 NaK9i8r746omw==
From: SeongJae Park <sj@kernel.org>
To: Leo Stone <leocstone@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	ruanjinjie@huawei.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] mm/damon: fix sparse warning for zero initializer
Date: Sun, 22 Sep 2024 08:11:20 -0700
Message-ID: <20240922151121.469051-1-sj@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240921195511.364023-1-leocstone@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Leo,


Thank you for this patch!

On Sat, 21 Sep 2024 12:54:45 -0700 Leo Stone <leocstone@gmail.com> wrote:

> sparse warns about zero initializing an array with {0,}, change it to
> the equivalent {0}.
> 
> Fixes the sparse warning:
> mm/damon/tests/vaddr-kunit.h:69:47: warning: missing braces around initializer
> 
> Signed-off-by: Leo Stone <leocstone@gmail.com>

Reviewed-by: SeongJae Park <sj@kernel.org>

I also think below tag would be good to add?

17ccae8bb5c9 ("mm/damon: add kunit tests")

Thanks,
SJ

> ---
>  mm/damon/tests/vaddr-kunit.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/damon/tests/vaddr-kunit.h b/mm/damon/tests/vaddr-kunit.h
> index a339d117150f..3dad8dfd9005 100644
> --- a/mm/damon/tests/vaddr-kunit.h
> +++ b/mm/damon/tests/vaddr-kunit.h
> @@ -66,7 +66,7 @@ static int __link_vmas(struct maple_tree *mt, struct vm_area_struct *vmas,
>  static void damon_test_three_regions_in_vmas(struct kunit *test)
>  {
>  	static struct mm_struct mm;
> -	struct damon_addr_range regions[3] = {0,};
> +	struct damon_addr_range regions[3] = {0};
>  	/* 10-20-25, 200-210-220, 300-305, 307-330 */
>  	struct vm_area_struct vmas[] = {
>  		(struct vm_area_struct) {.vm_start = 10, .vm_end = 20},
> -- 
> 2.43.0
