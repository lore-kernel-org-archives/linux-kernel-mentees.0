Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3051225522B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 06:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755238150; cv=none; b=eWgAxoBttHjIvez/JQAkjRE8h8gRxMa38ege4XdZC2mhXg/AJ8I5OJoLnSGGe8znTpkf8KCMzNx6b/SyDFMbTvTk5qC7Qlkf/sh2P/NP8icLgHGnBaQ4PDw5iO97LxBtZSxHqfF5ElkHVZZLzSpspCyOQaGUnMQVd3TxDNH5l84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755238150; c=relaxed/simple;
	bh=mRn+1Pe0OUG5BtFAy3VwFP0Rk0qogNg0sXk/t/7nkvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tC/YCFoTQkQ8tB80Pw0tAaDVxw0NF23fY6//4rAX3aH54ZeSVz1n+q9DhOWBY/waDs+cQButxAmwY5+83aJc38TgoKsTM/lDkGR3HKUwsoCJJ1qbX93iMW5hJWPPbTN6dOtwR+5I5qWlzQMe2nMlvzwUAOAk0DG7tuiBMkf5sFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V/BLvZpz; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V/BLvZpz"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB0DC4095E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 06:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.457
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5C2mMf0BWvqA for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Aug 2025 06:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=ming.lei@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFD0D409BD
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFD0D409BD
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V/BLvZpz
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EFD0D409BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 06:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755238144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CeuGtP6oJ3ASX+epXJ2slnSpr56EeHAKpiiitD+NUT8=;
	b=V/BLvZpz4t6/gA8hbYDMfJFRt0VKn0AAtrxnv1FVmADyg0c8tHaRnIsifT3cEt8iIklM0E
	Ldug0e3KfW8zVRvZwLx9oM4p7vRdpTLu/BTgXiqVr4jxvF6GXRDHrqbUKGMpHGftjDc4p/
	ncHYO0GZfpuDy4l0eKHFouxHMjI3VCs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-47MEAmEaMX-2fN6VqUisUA-1; Fri,
 15 Aug 2025 02:09:03 -0400
X-MC-Unique: 47MEAmEaMX-2fN6VqUisUA-1
X-Mimecast-MFC-AGG-ID: 47MEAmEaMX-2fN6VqUisUA_1755238141
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 91B92195422A;
	Fri, 15 Aug 2025 06:09:01 +0000 (UTC)
Received: from fedora (unknown [10.72.116.153])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D3D6B1955E89;
	Fri, 15 Aug 2025 06:08:56 +0000 (UTC)
Date: Fri, 15 Aug 2025 14:08:51 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Soham Metha <sohammetha01@gmail.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH 3/6] selftests: ublk: fixed spelling mistake in output
Message-ID: <aJ7O8_3_GEhc6Xq1@fedora>
References: <20250815000859.112169-1-sohammetha01@gmail.com>
 <20250815001803.112924-1-sohammetha01@gmail.com>
 <20250815001803.112924-2-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815001803.112924-2-sohammetha01@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Fri, Aug 15, 2025 at 05:48:00AM +0530, Soham Metha wrote:
> found/fixed following typos
> 
> - faile -> failed
> 
> in `tools/testing/selftests/ublk/test_common.sh`
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thanks,
Ming

