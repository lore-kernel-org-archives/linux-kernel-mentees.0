Return-Path: <SRS0=3SZq=D7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07288C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 05:24:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7665C22254
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 05:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdwOMut2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7665C22254
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13C56878A4;
	Sat, 24 Oct 2020 05:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHpOqCNa3gQh; Sat, 24 Oct 2020 05:24:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5525E87875;
	Sat, 24 Oct 2020 05:24:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B027C088B;
	Sat, 24 Oct 2020 05:24:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5C23C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 05:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 87C6D228CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 05:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4i-rVuLJnwT5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 05:23:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 8869B2079A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 05:23:58 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id g16so343942pjv.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 22:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IRCTFLxnKQ3FPr8M9KF2s2918UZVWOkYh+ykqRS7IC8=;
 b=gdwOMut2p1pDRPPYhKTUmDnE7ySPIU7AZA/B8IoIMY03gGP2UbrLCHxc/jio9G3vn3
 D4+H0QXF6o7PQQc8lShXEBOIO4eauP7ObDU0aRfWMcBNgJZ5m7fPeKtiYDxtfQgjBuJL
 1lIM7nDi3GIdBmDfBN0Az3kZ+AdyG7GGs/CRE1eB6+vTzTG3ea8nG2Zfv/dYzxSZCFeU
 Nbf9MYKtfSIFbMEeUvO/U3Jr6obRJFdZcfHghw1eaz8Q9e1y2UCDMOvSQUNOnKWZJp7y
 udHZSKhaUfTos0frHx96uPSgWejxVJaMXZmmiRhKyGLXLDiaM8A04sg33YD387fXFs7v
 7wrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IRCTFLxnKQ3FPr8M9KF2s2918UZVWOkYh+ykqRS7IC8=;
 b=KUntZj+lCxrBVhmgpuQkV/IxjQ0I5rUez4/qh5Z3pOZLRXmVlEp11ntLdTO7Qzv3IZ
 PPuyfRj+c74fTwS0cJTaEIA+hx8zxm+jXk3BWBU91fQyvh0AGENkLVr0JQWXYdTJPHm+
 dwSqMm68BK8+u8s+cYKBOmIcxq4Byx3BsboHfGmkBAeznSpp1/kAESgrtgJLfzN/TQIB
 9rDoAJHMakNNArB6lS0MkM/wtIEnodegvqqQfeRQvNUvfiyPq+0DvE7rDKAUUK8kmps1
 tvXRMVkV52G11nZQ8OtahpW8zKZRXiUwpikZy9CkoWeuRc9XeRHxh57VeE2yKBsfBbHk
 sXQg==
X-Gm-Message-State: AOAM530r0iwCyPwzKPHVRuD0oClmaDT7LQ8MC97JSr8M8GMAvC253Keh
 tP76WCRBgwtqOwmByEYxq+8=
X-Google-Smtp-Source: ABdhPJy89fRYqOs1olXn9jsRFF9ut58I9WltmtEJObxNLDMrDIz0woJO2qDWi9vX2eviuL3a6VyAFQ==
X-Received: by 2002:a17:902:7102:b029:d3:ef48:e51e with SMTP id
 a2-20020a1709027102b02900d3ef48e51emr2158617pll.72.1603517038007; 
 Fri, 23 Oct 2020 22:23:58 -0700 (PDT)
Received: from [192.168.86.81] ([106.51.242.32])
 by smtp.gmail.com with ESMTPSA id z23sm3515874pgf.12.2020.10.23.22.23.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 22:23:57 -0700 (PDT)
To: Marco Elver <elver@google.com>
References: <20201023150536.282568-1-98.arpi@gmail.com>
 <20201023184803.GA3922681@elver.google.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <91906d36-1f5b-b388-42a7-881b0915f0ea@gmail.com>
Date: Sat, 24 Oct 2020 10:53:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201023184803.GA3922681@elver.google.com>
Content-Language: en-US
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-kselftest@vger.kernel.org, yzaikin@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 1/2] kunit: Support for
	Parameterized Testing
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 24/10/20 12:18 am, Marco Elver wrote:
> On Fri, Oct 23, 2020 at 08:35PM +0530, Arpitha Raghunandan wrote:
>> Implementation of support for parameterized testing in KUnit.
> 
> Already looks much cleaner, thanks for using this approach!
> 
> I think the commit message needs a brief summary of the approach.
> 

Okay, I will add a more detailed commit message for the next version.

>> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
>> ---
>> Changes v1->v2:
>> - Use of a generator method to access test case parameters
>>
>>  include/kunit/test.h | 45 ++++++++++++++++++++++++++++++++++++++++++++
>>  lib/kunit/test.c     | 20 +++++++++++++++++++-
>>  2 files changed, 64 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/kunit/test.h b/include/kunit/test.h
>> index a423fffefea0..c417ac140326 100644
>> --- a/include/kunit/test.h
>> +++ b/include/kunit/test.h
>> @@ -141,6 +141,7 @@ struct kunit;
>>  struct kunit_case {
>>  	void (*run_case)(struct kunit *test);
>>  	const char *name;
>> +	void* (*generate_params)(struct kunit *test, void *prev);
> 
> Would adding documentation above this field be the right place, or
> somewhere else? In any case, some explanation of the protocol would be
> good.
> 

I will include this.

>>  	/* private: internal use only. */
>>  	bool success;
>> @@ -162,6 +163,9 @@ static inline char *kunit_status_to_string(bool status)
>>   * &struct kunit_case for an example on how to use it.
>>   */
>>  #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
>> +#define KUNIT_CASE_PARAM(test_name, gen_params)			\
>> +		{ .run_case = test_name, .name = #test_name,	\
>> +		  .generate_params = gen_params }
>>  
>>  /**
>>   * struct kunit_suite - describes a related collection of &struct kunit_case
>> @@ -208,6 +212,15 @@ struct kunit {
>>  	const char *name; /* Read only after initialization! */
>>  	char *log; /* Points at case log after initialization */
>>  	struct kunit_try_catch try_catch;
>> +	/* param_values points to test case parameters in parameterized tests */
>> +	void *param_values;
>> +	/*
>> +	 * current_param stores the index of the parameter in
>> +	 * the array of parameters in parameterized tests.
>> +	 * current_param + 1 is printed to indicate the parameter
>> +	 * that causes the test to fail in case of test failure.
>> +	 */
>> +	int current_param;
>>  	/*
>>  	 * success starts as true, and may only be set to false during a
>>  	 * test case; thus, it is safe to update this across multiple
>> @@ -1742,4 +1755,36 @@ do {									       \
>>  						fmt,			       \
>>  						##__VA_ARGS__)
>>  
>> +/**
>> + * kunit_param_generator_helper() - Helper method for test parameter generators
>> + * 				    required in parameterized tests.
>> + * @test: The test context object.
>> + * @prev_param: a pointer to the previous test parameter, NULL for first parameter.
>> + * @param_array: a user-supplied pointer to an array of test parameters.
>> + * @array_size: number of test parameters in the array.
>> + * @type_size: size of one test parameter.
>> + */
>> +static inline void *kunit_param_generator_helper(struct kunit *test,
> 
> I don't think this needs to be inline, but see my other suggestion
> below, which might make this function obsolete.
> 
>> +					void *prev_param,
>> +					void *param_array,
>> +					size_t array_size,
>> +					size_t type_size)
>> +{
>> +	KUNIT_ASSERT_EQ(test, (prev_param - param_array) % type_size, 0);
>> +
>> +	if (!prev_param)
>> +		return param_array;
>> +
>> +	KUNIT_ASSERT_GE(test, prev_param, param_array);
>> +
>> +	if (prev_param + type_size < param_array + (array_size * type_size))
>> +		return prev_param + type_size;
>> +	else
>> +		return NULL;
>> +}
>> +
>> +#define KUNIT_PARAM_GENERATOR_HELPER(test, prev_param, param_array, param_type) \
>> +	kunit_param_generator_helper(test, prev_param, param_array,		\
>> +				ARRAY_SIZE(param_array), sizeof(param_type))
> 
> You do not need param_type, you can use the same trick that ARRAY_SIZE
> uses:
> 
> 	#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
> 
> So you could use sizeof((param_aray)[0]) instead of sizeof(param_type).
> ARRAY_SIZE already checks for you that it's a real array via
> __must_be_array().
> 
> 
> The other question is, will kunit_param_generator_helper() find much use
> without the KUNIT_PARAM_GENERATOR_HELPER() macro? If I have some
> complicated generator protocol to generate params, then I'd just
> directly write the generator function. If your intent is to simplify the
> common-case array based generators, why not just have a macro generate
> the generator function?
> 
> More specifically, have this macro here:
> 
> +#define KUNIT_ARRAY_PARAM(name, array)								\
> +	static void *name##_gen_params(struct kunit *test, void *prev)				\
> +	{											\
> +		typeof((array)[0]) *__next = prev ? ((typeof(__next)) prev) + 1 : (array);	\
> +		return __next - (array) < ARRAY_SIZE((array)) ? __next : NULL;			\
> +	}
> 
> [ It is entirely untested, but if it works verbatim you'll probably need my
> 
> 	Co-developed-by: Marco Elver <elver@google.com>
> 	Signed-off-by: Marco Elver <elver@google.com>
>  
>  just in case... ]
> 
> Then, it can be used as follows:
> 
> 	static int num_cpus[] = {1, 2, 3, 4, 5};
> 	KUNIT_ARRAY_PARAM(num_cpus, num_cpus);
> 
> Then somewhere else:
> 
> 	KUNIT_CASE_PARAM(some_test, num_cpus_gen_params);
> 

Yes, a macro can be used to generate the generator function. I will work with this
for the next version.

>>  #endif /* _KUNIT_TEST_H */
>> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
>> index 750704abe89a..0e6ffe6384a7 100644
>> --- a/lib/kunit/test.c
>> +++ b/lib/kunit/test.c
>> @@ -127,6 +127,11 @@ unsigned int kunit_test_case_num(struct kunit_suite *suite,
>>  }
>>  EXPORT_SYMBOL_GPL(kunit_test_case_num);
>>  
>> +static void kunit_print_failed_param(struct kunit *test)
>> +{
>> +	kunit_err(test, "\n\tTest failed at parameter: %d\n", test->current_param + 1);
>> +}
>> +
>>  static void kunit_print_string_stream(struct kunit *test,
>>  				      struct string_stream *stream)
>>  {
>> @@ -168,6 +173,8 @@ static void kunit_fail(struct kunit *test, struct kunit_assert *assert)
>>  	assert->format(assert, stream);
>>  
>>  	kunit_print_string_stream(test, stream);
>> +	if (test->param_values)
>> +		kunit_print_failed_param(test);
>>  
>>  	WARN_ON(string_stream_destroy(stream));
>>  }
>> @@ -239,7 +246,18 @@ static void kunit_run_case_internal(struct kunit *test,
>>  		}
>>  	}
>>  
>> -	test_case->run_case(test);
>> +	if (!test_case->generate_params) {
>> +		test_case->run_case(test);
>> +	} else {
>> +		test->param_values = test_case->generate_params(test, NULL);
>> +		test->current_param = 0;
>> +
>> +		while (test->param_values) {
>> +			test_case->run_case(test);
>> +			test->param_values = test_case->generate_params(test, test->param_values);
>> +			test->current_param++;
>> +		}
>> +	}
>>  }
>>  
>>  static void kunit_case_internal_cleanup(struct kunit *test)
> 
> Otherwise looks fine.
> 
> Thanks,
> -- Marco
> 

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
