Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B8C29898A
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021362; cv=none; b=H5+btKLpFlul5gOYnEWBJrOKScNkWwB3/n0eZhO9CzS2CyoouyVIiwiJKE2jOjwzg2BNUomaiiKnofBbjtTVyyRxPJqzitHwkc9enOYFlLfqBOIi4bVvVXwZd5uYgGbdCvv0+WTwXZ4D8iPsB5et7OMJTX8cUGaWcZquidtoNlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021362; c=relaxed/simple;
	bh=8wJq7CJj1ACgt2A1eG9/dKcPUVrCSJCqNlO3bxAC0Vw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=onDYD8/TIHMY5WZqaXcCzHq5qWDZSrhAFEuqRNoDeFplU5TOHdEi+a6DmttJXZH+/4m6AK0+ToInVxZT6VsgcqEs/zn/5n0AXA0m3D/hhxEnurDpz4wC1ecv8M1V7Ss28RiWyG8piKgMRarMzlVn4cNUxWTlos0BZ/XKCpe3uNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cn9gEZkZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cn9gEZkZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748021359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8wJq7CJj1ACgt2A1eG9/dKcPUVrCSJCqNlO3bxAC0Vw=;
	b=Cn9gEZkZFDybk4ipYM2Fjhq+uKsHx+JNqzfUWEEnLa5V/QN2g0X8+G2oE3DARHOkMaNT4X
	grwDBuiC7ikfhna7o+vVnEFKl8mhvxUgk053/t70wfVsS5AId7+cIj8yjr7EskwolNtR2I
	Vk2esA2LToK3jt+h9VoXFXBdbs8jq4s=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-8-ZLqVJvnAN7qYVfeu9S3-0w-1; Fri,
 23 May 2025 13:29:16 -0400
X-MC-Unique: ZLqVJvnAN7qYVfeu9S3-0w-1
X-Mimecast-MFC-AGG-ID: ZLqVJvnAN7qYVfeu9S3-0w_1748021354
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 39EA1180034E;
	Fri, 23 May 2025 17:29:13 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.88.72])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 37F29195608F;
	Fri, 23 May 2025 17:29:07 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>
Cc: <pablo@netfilter.org>,  <kadlec@netfilter.org>,  <davem@davemloft.net>,
  <edumazet@google.com>,  <kuba@kernel.org>,  <pabeni@redhat.com>,
  <horms@kernel.org>,  <shuah@kernel.org>,  <echaudro@redhat.com>,
  <i.maximets@ovn.org>,  <netfilter-devel@vger.kernel.org>,
  <coreteam@netfilter.org>,  <netdev@vger.kernel.org>,
  <linux-kselftest@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <skhan@linuxfoundation.org>,  <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH v2] selftests: net: fix spelling and grammar mistakes
In-Reply-To: <20250523022242.3518-1-praveen.balakrishnan@magd.ox.ac.uk>
	(Praveen Balakrishnan's message of "Fri, 23 May 2025 03:22:42 +0100")
References: <4f0d5c19-8358-4e5b-a8f0-3adcee34ffd4@linuxfoundation.org>
	<20250523022242.3518-1-praveen.balakrishnan@magd.ox.ac.uk>
Date: Fri, 23 May 2025 13:29:06 -0400
Message-ID: <f7tldqn9qxp.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk> writes:

> Fix several spelling and grammatical mistakes in output messages from
> the net selftests to improve readability.
>
> Only the message strings for the test output have been modified. No
> changes to the functional logic of the tests have been made.
>
> Signed-off-by: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>
> ---

LGTM - thanks for fixing the ovs-dpctl.py output.

For the OVS test

Reviewed-by: Aaron Conole <aconole@redhat.com>

