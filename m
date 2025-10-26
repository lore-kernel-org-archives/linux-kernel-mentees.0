Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BFC2E0406
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761494044; cv=none; b=Si2351y4pIRw85nqCsR5pE/w+4EzdPgrt8ObQmA0gP9My1VN7rYW0OW1fsRlxzjGvFyVGZIOBHqeGLQzwHBk5zSFp1BB1icaLJGXxD7Cd0DmvkztshoHUpwXKqT9ukaq3Je7WkDkvwsEXHs9Df2VIvMz7uMP5OUzv//FsuPhO4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761494044; c=relaxed/simple;
	bh=yuj6B/4jdw5JEcTrXhjojLU0Yio81Or2fV2JsultxwA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eq5PxGkvuhDa+nx/YUP7joeYUpYrIIn6YG+Q2hCRueVxdRLGUHqX0a85dQZz0NxjKiaYWzmqrd/1p/Z9N8UW81mZ4Fkr8SobV5EX7CVNCaeJ4vCeqq0lg/9s98oRYsO2CdT+SZ9gKnXxhbzU4MTrdIJ2hUWg7vgp9c+N2FnVgf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3QR99tz; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3QR99tz"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE68980E95
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 15:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hAULkoHGtqA for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Oct 2025 15:54:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22A3480E93
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22A3480E93
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h3QR99tz
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 22A3480E93
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 15:54:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64E4460055;
	Sun, 26 Oct 2025 15:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B038EC4CEE7;
	Sun, 26 Oct 2025 15:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761494039;
	bh=yuj6B/4jdw5JEcTrXhjojLU0Yio81Or2fV2JsultxwA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h3QR99tzfIu+K7ksVCwtEPWxwQ9sECLZsLctJSK9pvZ0dfZ0Le1G6+7Y1BhN2jW8Q
	 62tBIMX3gVFIdxnH8YSbdrwYVfqOg+MowM2OvHIsjPByKIVRWXFKF9JKWW1F9heQpk
	 qp0ZI4q7oPp9UhM4RvxeIGbgC+lNn6iQIa8Jlp5UfeADK6SSz5GOJJv1hEjofBriZU
	 UN7OYmhdjrQZcQyHufPPRAbgdcCLcs28WujPXet7IijwO6fTcpNzZedW3lSYs6LZ18
	 Bq9eemWv0Bm/7NiUo/QQrUPMoJuuGWtofXbOV48Jn2UPK1JrCfLdI1oqE94I0Y4ri4
	 GEdYmegIzdpLg==
From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Niklas Cassel <cassel@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Mohamed Khalfella <khalfella@gmail.com>, 
 Christian Bruel <christian.bruel@foss.st.com>, 
 Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
In-Reply-To: <20251014024109.42287-1-bhanuseshukumar@gmail.com>
References: <20251014024109.42287-1-bhanuseshukumar@gmail.com>
Subject: Re: [PATCH v3] PCI: endpoint: pci-epf-test: Fix sleeping function
 being called from atomic context
Message-Id: <176149403315.9388.15839787422598934486.b4-ty@kernel.org>
Date: Sun, 26 Oct 2025 21:23:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 14 Oct 2025 08:11:09 +0530, Bhanu Seshu Kumar Valluri wrote:
> When Root Complex (RC) triggers a Doorbell MSI interrupt to Endpoint (EP)
> it triggers a warning in the EP. pci_endpoint kselftest target is
> compiled and used to run the Doorbell test in RC.
> 
> BUG: sleeping function called from invalid context at kernel/locking/mutex.c:271
> Call trace:
>  __might_resched+0x130/0x158
>  __might_sleep+0x70/0x88
>  mutex_lock+0x2c/0x80
>  pci_epc_get_msi+0x78/0xd8
>  pci_epf_test_raise_irq.isra.0+0x74/0x138
>  pci_epf_test_doorbell_handler+0x34/0x50
> 
> [...]

Applied, thanks!

[1/1] PCI: endpoint: pci-epf-test: Fix sleeping function being called from atomic context
      commit: 25423cda145f9ed6ee4a72d9f2603ac2a4685e74

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

